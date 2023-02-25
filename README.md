# ansible-playbook

This is my personal playbook (currently WIP) for setting up my development environment on a new machine.

The playbook is designed to be run on a fresh install of Manjaro Linux. In the future, I plan to add support to run it on MacOS too.

## Table of Contents

- [Prerequisites](#prerequisites)
- [What is included](#what-is-included)
- [Running the playbook](#running-the-playbook)
- [Development](#development)

## Prerequisites

- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Ansible Lint](https://docs.ansible.com/ansible-lint/)
- [Curl](https://curl.se/docs/install.html)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Python](https://www.python.org/downloads/) >= 3.0

## What is included

## Running the playbook

## Development

There's a Dockerfile included in the project that can be used to run the playbook in a container. This is useful for testing the playbook on a fresh install of Manjaro Linux and check that everything is working as expected.

First of all, you need to build the Docker image by running the following command:

```bash
docker build . -t fresh-machine --build-arg username=<your-username>
```

After the image is built, you can run the playbook directly in the container by running the following command:

```bash
docker run --rm -it fresh-machine ansible-playbook playbook.yml --extra-vars "user_name=<your-username>" -vvvv # or any other verbosity level
```

If you want to run a specific role, you can run the following command:

```bash
docker run --rm -it fresh-machine ansible-playbook playbook.yml --tags <role-name> --extra-vars "user_name=<your-username>" -vvvv # or any other verbosity level
```

You can call bash inside the container and run the playbook from there, to check that everything is working as expected in some specific scenario, by running the following command:

```bash
docker run --rm -it fresh-machine bash
```
