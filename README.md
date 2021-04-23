### Omnibus ML

Machine learning examples, primarily using Python.

cd into ubuntu-python-base:
	docker build -t ubuntu-python-base .

then cd into tensorflow-docker:
	docker build -t tensorflow .

Then:
docker run --rm -it -p 8888:8888 tensorflow