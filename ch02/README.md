TPC-DS Generator
================

### Downloading

    $ git clone <INSERT URL>

### Usage

*First*, build the project

    $ cd tpcds-gen
    $ ./01_build.sh
    Downloading TPC-DS...
    Uncompressing TPC-DS...

*Second*, generate your dataset

    $ ./02_generate.sh
    Building your dataset (this may take some time)...

### Advanced Usage

*SCALE* - allows you to define the scale setting for TPC-DS to use when generating the dataset. Do this by overriding your SCALE argument

    $ export SCALE=5
    $ ./02_generate.sh
    Using scale factor of 5 (~5MB)
    Building your dataset (this may take some time)...
