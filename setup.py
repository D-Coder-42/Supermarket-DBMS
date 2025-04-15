from setuptools import setup, find_packages

setup(
    name="supermarket_management_system",
    version="1.0.0",
    packages=find_packages(),
    install_requires=[
        "psycopg2-binary==2.9.9",
    ],
    python_requires=">=3.6",
) 