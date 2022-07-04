.PHONY: all
all: cython
	python setup.py build_ext -i -f

.PHONY: black
black:
	black -S msgpacktypedints/ test/ setup.py

.PHONY: cython
cython:
	cython --cplus msgpacktypedints/_cmsgpack.pyx

.PHONY: test
test: cython
	pip install -e .
	pytest -v test
	MSGPACK_PUREPYTHON=1 pytest -v test

.PHONY: serve-doc
serve-doc: all
	cd docs && make serve

.PHONY: clean
clean:
	rm -rf build
	rm -f msgpacktypedints/_cmsgpack.cpp
	rm -f msgpacktypedints/_cmsgpack.*.so
	rm -f msgpacktypedints/_cmsgpack.*.pyd
	rm -rf msgpacktypedints/__pycache__
	rm -rf test/__pycache__

.PHONY: update-docker
update-docker:
	docker pull quay.io/pypa/manylinux2014_i686
	docker pull quay.io/pypa/manylinux2014_x86_64
	docker pull quay.io/pypa/manylinux2014_aarch64

.PHONY: linux-wheel
linux-wheel:
	docker run --rm -v `pwd`:/project -w /project quay.io/pypa/manylinux2014_i686   bash docker/buildwheel.sh
	docker run --rm -v `pwd`:/project -w /project quay.io/pypa/manylinux2014_x86_64 bash docker/buildwheel.sh

.PHONY: linux-arm64-wheel
linux-arm64-wheel:
	docker run --rm -v `pwd`:/project -w /project quay.io/pypa/manylinux2014_aarch64   bash docker/buildwheel.sh
