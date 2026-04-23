.PHONY: test tests deploy check teardown

test tests:
	python3 -m pytest -q

deploy:
	bash scripts/deploy.sh

check:
	bash scripts/check_registration.sh

teardown:
	bash scripts/teardown.sh
