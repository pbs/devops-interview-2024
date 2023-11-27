# Sets up the connectivity to AWS via a terraform provider.

provider "aws" {
  region  = "us-east-1"
  profile = "pbs-interview-acct" #This is a fake profile - place your own aws account/profile name here if desired.
}