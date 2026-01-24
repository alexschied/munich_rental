# Variables
PYTHON := .venv/bin/python
PIP := .venv/bin/pip
PROJECT_NAME := otc_markets

.PHONY: help install kernel test lint format clean nb-clean

help:
	@echo "Available commands:"
	@echo "  make install  - Create venv and install package with dev extras"
	@echo "  make kernel   - Register the venv as a Jupyter Kernel"
	@echo "  make test     - Run tests using pytest"
	@echo "  make lint     - Check code quality with Ruff"
	@echo "  make format   - Format code with Ruff"
	@echo "  make nb-clean - Strip outputs from notebooks (cleaner Git diffs)"
	@echo "  make clean    - Remove cache files and the virtual environment"

install:
	@echo "Creating virtual environment..."
	python3 -m venv .venv
	$(PIP) install --upgrade pip
	@echo "Installing package in editable mode with [dev] extras..."
	$(PIP) install -e ".[dev]"

kernel:
	@echo "Registering Jupyter Kernel for $(PROJECT_NAME)..."
	$(PYTHON) -m ipykernel install --user --name=$(PROJECT_NAME) --display-name "Python ($(PROJECT_NAME))"

test:
	$(PYTHON) -m pytest

lint:
	$(PYTHON) -m ruff check .

format:
	$(PYTHON) -m ruff format .

nb-clean:
	@echo "Cleaning notebook outputs..."
	$(PYTHON) -m nbconvert --ClearOutputPreprocessor.enabled=True --inplace notebooks/*.ipynb

clean:
	@echo "Cleaning up..."
	rm -rf .venv
	rm -rf .pytest_cache
	rm -rf .ruff_cache
	find . -type d -name "__pycache__" -exec rm -rf {} +
	@echo "Cleanup complete."