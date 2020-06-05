#!/usr/bin/octave -qf

printf ("current directory: %s\n", pwd())
addpath("src")
arg_list = argv ();
if nargin != 3
  printf ("ERROR: There should be 3 args. A .csv file containing the experiment data, a .yaml file containing the anthropometric data of the subject and the dir where the results will be stored\n");
  printf ("Usage:\n");
  printf ("\t./pi_csic.m csv_filename yaml_anthropometric_filename result_dir\n\n");
  exit(127);
endif

printf ("csv file: %s\n", arg_list{1});
printf ("anthropometric file: %s\n", arg_list{2});
printf ("result dir: %s\n", arg_list{3});

computePI(arg_list{1}, arg_list{2}, arg_list{3})