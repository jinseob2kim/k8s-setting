## kpos
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x ./kops
sudo mv ./kops /usr/local/bin/


## kubectl
curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

## aws cli
pip install awscli


## Run

kops create cluster \
--cloud aws \
--name anpanman \
--state s3://clusters.app.anpanman.co.kr \
--topology private \
--zones ap-northeast-2a,ap-northeast-2c \
--master-zones ap-northeast-2a \
--networking calico \
--bastion \
--ssh-public-key ddd.pem \
--node-count=2 \
--node-size=t2.medium \
--master-size=t2.medium \
--master-count=1

