install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vvv --cov=hello --cov=greeting \
		--cov=smath --cov=web tests
	python -m pytest --noval notebook.ipynb #tests out jupyter notebook
	#python -m pytest -v tests/test_web.py #if you want to test web

debug:
	python -m pytest -vv --pdb #Debugger is invoked

one-test:
	python -m pytest -vv tests/test_greeting.py::test_my_name4

debugthree:
	#not working the way I expect
	python -m pytest -vv --pdb --maxfail=4 #drop to PDB for first three failures

lint:
	pylint --disable=R,C *.py

all: install lint test format