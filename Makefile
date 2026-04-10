.PHONY: test deploy check teardown

test:
	pytest -q

deploy:
	bash scripts/deploy.sh

check:
	bash scripts/check_registration.sh

teardown:
	bash scripts/teardown.sh
