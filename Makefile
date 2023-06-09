install:
	poetry install

build:
	poetry build

publish:
	poetry publish --dry-run

package-install:
	python3 -m pip uninstall hexlet-code -y
	python3 -m pip install --user dist/*.whl

uninstall:
	python3 -m pip uninstall dist/*.whl

dev:
	poetry run flask --app page_analyzer:app run

updsetuptools:
	pip install --upgrade pippip install --force-reinstall -U setuptools

PORT ?= 8000
start: updsetuptools
	poetry run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

setup: install build package-install

lint:
	poetry run flake8 page_analyzer