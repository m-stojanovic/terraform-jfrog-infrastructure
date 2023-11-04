TERRAFORM="terraform_1_0.8"
all: format init plan

format:
	${TERRAFORM} -chdir=tf/main fmt

init:
	${TERRAFORM} -chdir=tf/main init

plan:
	${TERRAFORM} -chdir=tf/main plan

# jlint:
# 	scripts/jlinter.sh Jenkinsfile
