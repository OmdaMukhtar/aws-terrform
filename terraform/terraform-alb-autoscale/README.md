# Terraform Modules 

![terraform architecture](assets/alb.png)

## Connecting through SSH
I had faced  an issue to connecting one of the ec2 instance belong to the autoscaling group
so you have to use Bastion instance(deploy public ec2 instance in your network) to access your private instance.

## Requirements
- ALB
- ASG
    - Target Groups
- VPC with
    - one internet gateway
    - one Nat gateway
    - two  subnets public --> running in two different AZ
    - two subnets private --> running in two different AZ
- Optional (deploy ec2 instance as Bastion )
- Security groups
    - one for ALB
        - allow inbound port 80/443
    - one for ec2 instance ASG
        - open inbound for 80
        - open outboud for all traffic


# After Deployment Success
![alt text](assets/image.png)