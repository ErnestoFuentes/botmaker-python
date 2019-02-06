import pytest

from botmaker import Client


@pytest.fixture(scope='module')
def vcr_config():
    config = dict()
    # Replace the Authorization request header with 'DUMMY' in cassettes
    config['filter_headers'] = [('access-token', 'DUMMY')]
    return config


@pytest.fixture
def client():
    # Using BOTMAKER_ACCESS_TOKEN from env
    yield Client()