# Baby Project Deployment
We use a micro repo structure for a few reasons, but the main one is that we can make use of
GitHub pages for each repo separately. That way we can deploy our documentation, test coverage, or even a full web app without extra fees. 
That comes with some drawbacks, but some benefits as well. We publish individual releases from
each repo and use this repo to deploy them.

We use [Dokku](https://dokku.com/) for deployment. The main reason is that it's quite easy to set up, scale, and maintain. You can however deploy it locally as well using Docker.

First build it 🛠
```shell
docker build --tag baby-project .
```
Then run it 🏃‍
```shell
docker run --detach --publish 8080:80 baby-project
```
Then go to 
`localhost:8080`
and then you have the production environment running locally.

The official deployment to the server is done through GitHub actions. The process is basically just bumping the version in
the `.env` file that we keep in the version control and create a PR. Only orginization mebers can create PRs for this repo.
This is only for safety reasons. We don't want anyone to deploy unwanted changes.
