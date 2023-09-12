# Run in docker
docker run --rm -it amazon/aws-cli --version
docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli command
alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli'

# Run from binary
sudo apt update
sudo apt install unzip

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

aws configure --profile clitest
aws configure set region eu-central-1 --profile clitest
export AWS_PROFILE="clitest"

aws sts get-caller-identity --output json > ~/my_cli_user
aws iam list-users > ~/my_aws_users
