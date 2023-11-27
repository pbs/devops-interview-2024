# DevOps Interview 2024 Sample code

This repo is intended to be used as a reference for answering interview questions as part of our screening process for our open Sr. DevOps Engineer position. Interested? See https://careers.pbs.org for more info or to apply.

We're not asking you to run this code or write any new code (although you're certainly welcome to if you feel that will help you prepare), but we'd like to talk through some of what's happening here with you during your interview time with us.

## Scenario
PBS Food is launching a new, ridiculous, food-based game show centered around guacamole called "Guac Around the Clock". To promote the new show, we need to launch a new standalone wordpress site to share for marketing purposes. The code provided here is a first pass at creating this site, but it has some issues.

## Architecture
The site consists of a wordpress running in docker via AWS ECS. It is using a MySQL database running on AWS RDS. For static assets, we are using our static website module that builds an S3 bucket and a CloudFront distribution, and links the two together. The wp-admin will write uploaded media assets to the s3 bucket (via a wordpress plugin - don't worry too much about _which_ plugin).

## Questions / Problems

1. The ECS containers are spinning up, but they are not staying healthy. You check the ECS service logs and notice the following error message: `stopped reason: Task failed ELB health checks in target group`. What could you do to solve this?
2. The ECS container is running fine, but it cannot connect to the MySQL database. What are some of the reasons that may be the case, and how might you solve them?
3. The ECS container is unable to write assets to the s3 bucket provisioned in the static website module. What are some reasons that may be the case, and how might you solve them?
4. The WordPress is now running properly and the wp-admin can write static assets to the S3 bucket. However, when you load the homepage of the wordpress, the static assets are not rendered properly on the page. How might you debug this issue?