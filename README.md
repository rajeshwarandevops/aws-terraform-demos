```mermaid
flowchart TB
    %% Internet
    Internet["🌐 Internet"]:::internet

    %% VPC
    VPC["📦 VPC: aws_vpc.my-vpc\nCIDR: 10.0.0.0/16"]:::vpc

    %% Internet Gateway
    IGW["🌐 Internet Gateway: aws_internet_gateway.dfu-igw"]:::igw

    %% Route Table
    PublicRT["🛣 Public Route Table: aws_route_table.public-rt"]:::routetable

    %% Subnets
    PublicSubnet["🟢 Public Subnet: aws_subnet.Public-Subnet-A\n10.0.1.0/24"]:::publicsubnet
    PrivateSubnet["🔴 Private Subnet: aws_subnet.Privatesubnet-A\n10.0.2.0/24"]:::privatesubnet

    %% EC2
    EC2["💛 EC2 Instance: aws_instance.dfu_instance\nNginx Web Server"]:::ec2

    %% Security Group
    SG["🛡 Security Group: aws_security_group.dfusg"]:::securitygroup

    %% Key Pair and TLS
    KeyPair["🔑 Key Pair: aws_key_pair.dfu_key"]:::keypair
    TLSKey["🔐 TLS Private Key: tls_private_key.my_key"]:::tls
    LocalFile["📄 Private Key File: local_file.private_key_pem"]:::file

    %% Data Source
    AMI["📦 AMI: aws_ami.amazon_linux_2023"]:::ami

    %% Connections - Network Flow
    Internet -->|HTTP 80 / SSH 22| IGW
    IGW --> PublicRT
    PublicRT --> PublicSubnet
    PublicSubnet --> EC2

    PrivateSubnet -->|Internal / future DB| VPC

    %% EC2 associations
    EC2 --> SG
    EC2 --> KeyPair
    KeyPair --> TLSKey
    TLSKey --> LocalFile
    EC2 --> AMI

    %% VPC contains subnets
    VPC --> PublicSubnet
    VPC --> PrivateSubnet

    %% Styles
    classDef internet fill:#87CEEB,stroke:#333,stroke-width:1px;
    classDef vpc fill:#F0F8FF,stroke:#333,stroke-width:1px;
    classDef igw fill:#4682B4,stroke:#333,stroke-width:1px,color:#fff;
    classDef routetable fill:#B0E0E6,stroke:#333,stroke-width:1px;
    classDef publicsubnet fill:#90EE90,stroke:#333,stroke-width:1px;
    classDef privatesubnet fill:#FF6347,stroke:#333,stroke-width:1px,color:#fff;
    classDef ec2 fill:#FFD700,stroke:#333,stroke-width:1px;
    classDef securitygroup fill:#D3D3D3,stroke:#333,stroke-width:1px;
    classDef keypair fill:#FFE4B5,stroke:#333,stroke-width:1px;
    classDef tls fill:#FFA500,stroke:#333,stroke-width:1px;
    classDef file fill:#F5DEB3,stroke:#333,stroke-width:1px;
    classDef ami fill:#DCDCDC,stroke:#333,stroke-width:1px;
