# terraform Makefile: a few standard makefile commands wrapped in a makefile

TERRAFORM := $(PWD)/bin/terraform
TERRAVERS := 1.2.6
TERRAURL := https://releases.hashicorp.com/terraform/$(TERRAVERS)/terraform_$(TERRAVERS)_linux_amd64.zip

# "shortcut" to next target
terrabin: bin/terraform

# download and "install" terraform
bin/terraform:
	@mkdir -p bin && wget -q -O bin/terraform.zip $(TERRAURL) && cd bin && unzip -q terraform.zip && chmod +x terraform && rm terraform.zip

terraversion: $(TERRAFORM)
	@$(TERRAFORM) version

init: terrabin
	@cd terraform && $(TERRAFORM) init

plan: terrabin
	@cd terraform && $(TERRAFORM) plan -no-color

apply: terrabin
	@cd terraform && $(TERRAFORM) apply -input=false

apply_force: terrabin
	@cd terraform && $(TERRAFORM) apply -auto-approve -input=false

show: terrabin
	@cd terraform && $(TERRAFORM) show -no-color

output: terrabin
	@cd terraform && $(TERRAFORM) output

refresh: terrabin
	@cd terraform && $(TERRAFORM) refresh

fmt: terrabin
	@cd terraform && $(TERRAFORM) fmt

console: terrabin
	@cd terraform && $(TERRAFORM) console

destroy: terrabin
	@cd terraform && $(TERRAFORM) destroy

have_state: terraform/terraform.tfstate
        @echo "I don't have the state file: run 'make apply'"

# target to connect to instance for testing
ssh:
	@cd terraform && ssh -i ssh/key ec2-user@$$( $(TERRAFORM)  output  ec2_backend_ip | awk -F\" ' { print $$2 } ' )
