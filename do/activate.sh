if [ ! -f "do/activate.sh" ]; then
  echo "Please activate the environment at root directory."
  echo "Runs source do/activate.sh"
  exit 1
fi

# The git repository that do installed from.
# https://github.com/agilityio/oh-my-ops
DO_INSTALL_REPO="agilityio/oh-my-ops"
DO_VERSION="0.1.2"

# The array of plugin name to be included. If this variable is not specified
# all plugins found will be included by default.

DO_PLUGINS="proj git full prompt banner docker docker-compose
mongo postgres keycloak neo4j
redis npm tmux make sphinx exec mvn vg artifactory rabbitmq gitlab drone
registry pypiserver"

DO_ENVS='local prod'

cd do
source "src/init.sh"
cd ..

_do_log_level_info 'app'

# ------------------------------------------------------------------------------
# proj plugin
# ------------------------------------------------------------------------------
# Project is just a special repository that is the root of all sub repositories
# defined. Once the project is specified, no other repository or project
# can be defined beyond this root.
_do_proj '.' 'proj'

# ------------------------------------------------------------------------------
# full plugin
# ------------------------------------------------------------------------------
# Enables a special plugin that helps to perform all sub commands quicker.
# For instance, do-proj-full-clean will trigger do-doc-sphinx-clean,
# do-blog-mvn-clean, etc.
_do_log_level_info 'app' 'Turns on proj support'
_do_full_proj 'proj'

# ------------------------------------------------------------------------------
# git plugin
#
# Please try:
# ------------------------------------------------------------------------------
# Enables git support at the proj level.
# If you do multi-repo approach, you can specify the project starts
# at the parent directory of all git repositories
# and the defines sub repos below that and enable git support for all
# of them. Notes that this plugin expects to see "./.git" directory exists.
_do_git 'proj'
_do_log_info 'app' 'Turns on git support, please try:
  * do-proj-git-help: to see available commands
  * do-proj-git-status: to see the status of the git tree.
'

# ------------------------------------------------------------------------------
# mongo plugin
# ------------------------------------------------------------------------------
_do_mongo 'proj'
_do_log_info 'app' 'Turns on mongo support, please try:
  * do-proj-mongo-help: to see available commands
  * do-proj-mongo-start: to start the mongo db server
  * do-proj-mongo-stop: to stop the mongo db server
  * do-proj-mongo-status: to see the status the mongo db server
  * do-proj-mongo-logs: to see the latest logs from the mongo db server
  * do-proj-mongo-attach: to attach to the mongodb running docker container.
'

# ------------------------------------------------------------------------------
# postgres plugin
# ------------------------------------------------------------------------------
_do_postgres 'proj'
_do_log_info 'app' 'Turns on postgres support, please try:
  * do-proj-postgres-help: to see available commands
  * do-proj-postgres-start: to start the postgres db server
  * do-proj-postgres-stop: to stop the postgres db server
  * do-proj-postgres-status: to see the status the postgres db server
  * do-proj-postgres-logs: to see the latest logs from the postgres db server
  * do-proj-postgres-attach: to attach to the postgres running docker container.
'

# ------------------------------------------------------------------------------
# redis plugin
# ------------------------------------------------------------------------------
_do_redis 'proj'
_do_log_info 'app' 'Turns on redis support, please try:
  * do-proj-redis-help: to see available commands
  * do-proj-redis-start: to start the redis db server
  * do-proj-redis-stop: to stop the redis db server
  * do-proj-redis-status: to see the status the redis db server
  * do-proj-redis-logs: to see the latest logs from the redis db server
  * do-proj-redis-attach: to attach to the redis running docker container.
'

# ------------------------------------------------------------------------------
# neo4j plugin
# ------------------------------------------------------------------------------
_do_neo4j 'proj'
_do_log_info 'app' 'Turns on neo4j support, please try:
  * do-proj-neo4j-help: to see available commands
  * do-proj-neo4j-start: to start the neo4j db server
  * do-proj-neo4j-stop: to stop the neo4j db server
  * do-proj-neo4j-status: to see the status the neo4j db server
  * do-proj-neo4j-logs: to see the latest logs from the neo4j db server
  * do-proj-neo4j-attach: to attach to the neo4j running docker container.
'

# ------------------------------------------------------------------------------
# artifactory plugin
# ------------------------------------------------------------------------------
_do_artifactory 'proj'
_do_log_info 'app' 'Turns on artifactory support, please try:
  * do-proj-artifactory-help: to see available commands
  * do-proj-artifactory-start: to start the artifactory server
  * do-proj-artifactory-stop: to stop the artifactory server
  * do-proj-artifactory-status: to see the status the artifactory server
  * do-proj-artifactory-logs: to see the latest logs from the artifactory server
  * do-proj-artifactory-attach: to attach to the artifactory running docker container.
'
# ------------------------------------------------------------------------------
# rabbitmq plugin
# ------------------------------------------------------------------------------
_do_rabbitmq 'proj'
_do_log_info 'app' 'Turns on rabbitmq support, please try:
  * do-proj-rabbitmq-help: to see available commands
  * do-proj-rabbitmq-start: to start the rabbitmq server
  * do-proj-rabbitmq-stop: to stop the rabbitmq server
  * do-proj-rabbitmq-status: to see the status the rabbitmq server
  * do-proj-rabbitmq-logs: to see the latest logs from the rabbitmq server
  * do-proj-rabbitmq-attach: to attach to the rabbitmq running docker container.
'

# ------------------------------------------------------------------------------
# gitlab plugin
# ------------------------------------------------------------------------------
_do_gitlab 'proj'
_do_log_info 'app' 'Turns on gitlab support, please try:
  * do-proj-gitlab-help: to see available commands
  * do-proj-gitlab-start: to start the gitlab server
  * do-proj-gitlab-stop: to stop the gitlab server
  * do-proj-gitlab-status: to see the status the gitlab server
  * do-proj-gitlab-logs: to see the latest logs from the gitlab server
  * do-proj-gitlab-attach: to attach to the gitlab running docker container.
'
# ------------------------------------------------------------------------------
# drone plugin
# ------------------------------------------------------------------------------
_do_drone 'proj'
_do_log_info 'app' 'Turns on drone support, please try:
  * do-proj-drone-help: to see available commands
  * do-proj-drone-start: to start the drone server
  * do-proj-drone-stop: to stop the drone server
  * do-proj-drone-status: to see the status the drone server
  * do-proj-drone-logs: to see the latest logs from the drone server
  * do-proj-drone-attach: to attach to the drone running docker container.
'
# ------------------------------------------------------------------------------
# registry plugin
# ------------------------------------------------------------------------------
_do_registry 'proj'
_do_log_info 'app' 'Turns on registry support, please try:
  * do-proj-registry-help: to see available commands
  * do-proj-registry-start: to start the registry server
  * do-proj-registry-stop: to stop the registry server
  * do-proj-registry-status: to see the status the registry server
  * do-proj-registry-logs: to see the latest logs from the registry server
  * do-proj-registry-attach: to attach to the registry running docker container.
'

# ------------------------------------------------------------------------------
# pypiserver plugin
# ------------------------------------------------------------------------------
_do_pypiserver 'proj'
_do_log_info 'app' 'Turns on pypiserver support, please try:
  * do-proj-pypiserver-help: to see available commands
  * do-proj-pypiserver-start: to start the pypiserver server
  * do-proj-pypiserver-stop: to stop the pypiserver server
  * do-proj-pypiserver-status: to see the status the pypiserver server
  * do-proj-pypiserver-logs: to see the latest logs from the pypiserver server
  * do-proj-pypiserver-attach: to attach to the pypiserver running docker container.
'

# ------------------------------------------------------------------------------
# keycloak plugin
# ------------------------------------------------------------------------------
_do_keycloak 'proj'
_do_log_info 'app' 'Turns on keycloak support, please try:
  * do-proj-keycloak-help: to see available commands
  * do-proj-keycloak-start: to start the db server
  * do-proj-keycloak-stop: to stop the keycloak db server
  * do-proj-keycloak-status: to see the status the keycloak server
  * do-proj-keycloak-logs: to see the latest logs from the postgres db server
  * do-proj-keycloak-attach: to attach to the postgres running docker container.
'

# ------------------------------------------------------------------------------
# vg plugin
# ------------------------------------------------------------------------------
_do_repo 'vg' 'vgdemo'
_do_vg 'vgdemo'
_do_log_info 'app' 'Turns on vagrant support, please try:
  * do-vgdemo-vg-help: to see available commands
  * do-vgdemo-vg-start: starts and provisions the vagrant environment.
  * do-vgdemo-vg-stop: stops the vagrant machine.
  * do-vgdemo-vg-attach: connects to machine via SSH.
'

# ------------------------------------------------------------------------------
# tmux plugin
# ------------------------------------------------------------------------------
_do_tmux 'proj'

# ------------------------------------------------------------------------------
# exec plugin
# ------------------------------------------------------------------------------
_do_exec 'proj' 'bin'
_do_log_info 'app' 'Turns on script exec support for ./bin directory, please try:
  * do-proj-exec-help: to see available commands
  * do-proj-exec-hello: to trigger the "bin/hello.sh" script.
  * do-proj-exec-good-bye: to trigger the "bin/good/bye.sh" script.
'

# ------------------------------------------------------------------------------
# sphinx plugin
# ------------------------------------------------------------------------------

# Makes './doc' directory is a sub repository, named it doc.
_do_repo 'doc' 'doc'
_do_sphinx 'doc'

_do_log_info 'app' 'Turns on sphinx support at ./doc directory, please try:
  * do-doc-sphinx-help: to see available commands
  * do-doc-sphinx-start: to start the live reload server.
    After this, you can access the live html document at http://localhost:8383
  * do-doc-sphinx-stop: to stop the live html document server.
  * do-doc-sphinx-status: to see the status the sphinx doc server
  * do-doc-sphinx-logs: to see the latest logs from the sphinx doc server
  * do-doc-sphinx-attach: to attach to the sphinx running docker container.
'

# ------------------------------------------------------------------------------
# make plugin
# ------------------------------------------------------------------------------

# Makes 'make' directory is a sub repository, named it makedemo.
_do_repo 'make' 'makedemo'

# Marks the make repository support make command line.
_do_make_cli 'makedemo'
_do_log_info 'app' 'Turns on make support at ./make directory, please try:
  * do-makedemo-make-help: to see available commands
  * do-makedemo-make-clean: to trigger the "clean" target defined in the Makefile.
  * do-makedemo-make-build: to trigger the "build" target defined in the Makefile.
'
# ------------------------------------------------------------------------------
# docker plugin
# ------------------------------------------------------------------------------

# Makes 'docker' directory is a sub repository, named it dockerdemo.
_do_repo 'docker' 'dockerdemo'

_do_docker 'dockerdemo'
_do_log_info 'app' 'Turns on docker support at ./docker directory, please try:
  * do-dockerdemo-docker-help: to see available commands
  * do-dockerdemo-docker-build: to build the docker file found.
'

# ------------------------------------------------------------------------------
# docker-compose plugin
# ------------------------------------------------------------------------------

# Makes 'docker' directory is a sub repository, named it dockerdemo.
_do_repo 'docker-compose' 'dockercomposedemo'

_do_docker_compose 'dockercomposedemo'
_do_log_info 'app' 'Turns on docker support at ./docker-compose directory, please try:
  * do-dockercomposedemo-docker-compose-help: to see available commands
  * do-dockercomposedemo-docker-compose-build: to build the docker compose file found.
'

# ------------------------------------------------------------------------------
# mvn plugin
# ------------------------------------------------------------------------------
_do_repo 'mvn/blog' 'blog'
_do_mvn 'blog'
_do_log_info 'app' 'Turns on maven build support at ./mvn/blog directory, please try:
  * do-blog-mvn-help: to see available commands.
  * do-blog-mvn-clean: Clean the project build.
  * do-blog-mvn-build: compile the source code of the project.
  * do-blog-mvn-test: test the compiled source code using a suitable unit testing framework.
  * do-blog-mvn-install: install the package into the local maven repository,
'

# ------------------------------------------------------------------------------
# banner plugin
# ------------------------------------------------------------------------------
# http://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=hugepig
_do_banner 'Demo.'

# Marks that this is the end of the activation script.
# This will trigger any additional command send in with -e argument.
# For instance, if you run the script with
# bash do/activate.sh -e "do-proj-full-clean" -e "do-proj-full-build" then
# the two commands, clean & build shall be executed at this point.
# This bring the ability to run any command without the
# need of activate the oh-my-ops environment.
_do_activate_finished
