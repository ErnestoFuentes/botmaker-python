SHELL := bash
PATH := ./venv/bin:${PATH}
PYTHON=python3.7
PROJECT=botmaker


all: test

venv:
		$(PYTHON) -m venv --prompt $(PROJECT) venv
		source venv/bin/activate
		pip install --quiet --upgrade pip

install-test:
		pip install -q .[test]

test: clean install-test lint
		python setup.py test

lint:
		pycodestyle setup.py $(PROJECT)/ tests/

clean:
		find . -name '*.pyc' -exec rm -f {} +
		find . -name '*.pyo' -exec rm -f {} +
		find . -name '*~' -exec rm -f {} +
		rm -rf build dist $(PROJECT).egg-info

release: clean
		python setup.py sdist bdist_wheel
		twine upload dist/*


.PHONY: all install-test release test clean-pyc
