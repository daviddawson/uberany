# uberany
The idea is to point this docker at any git repo and have it run the project.

This assumes that the project has a build.sh (for setup and deployment) and a run.sh to run the project.

# Useage

Hopefully the plan will be to run it using

```bash
docker run -d --name ???? -e giturl=?????? cistechfutures/uberany:latest
```

