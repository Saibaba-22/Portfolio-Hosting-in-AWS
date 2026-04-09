# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami             = "ami-0b8b44ec9a8f90422" # Ubuntu 22.04 (us-east-1)
  instance_type   = "t3.small"
  subnet_id       = aws_subnet.my_subnet.id
  security_groups = [aws_security_group.my_sg.id]

  associate_public_ip_address = true

  # User Data script to install Nginx and write your exact HTML file
  user_data = <<-EOF
#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

# Write the full HTML file
cat << 'HTML_EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<body>

<!-- Header -->
<div class="header">
    <div class="left">
        <h1 class="name">SAIBABA KOLA</h1>
        <h2 class="designation">Junior DevOps Engineer | Cloud Engineer</h2>
        <p class="quote">
            “Building the future in the cloud — learning fast, deploying smarter, and growing with every challenge.” ☁️🚀
        </p>
    </div>

    <div class="right">
        <img class="profile" src="https://sai-portfolio-assets-12345.s3.amazonaws.com/proimage.png" alt="Profile Image">
    </div>
</div>

    <!-- About -->
    <section>
        <h3 class="section-title">About Me</h3>
        <p class="section-content">
            Passionate fresher with knowledge in cloud, DevOps tools, and automation. 
            Eager to learn and build real-world scalable applications.
        </p>
    </section>

<!-- SKILLS -->
<div class="section">
        <h3 class="section-title"> Skills </h3>
    <div class="skills-container">

        <div class="skill-box">
            <img src="https://img.icons8.com/color/48/microsoft-office-2019.png"/>
            <span class="skill-text">MS Office</span>
        </div>

        <div class="skill-box">
            <img src="https://img.icons8.com/color/24/azure-1.png"/>
            <span class="skill-text">Azure</span>
        </div>

        <div class="skill-box">
            <img src="https://img.icons8.com/color/24/amazon-web-services.png"/>
            <span class="skill-text">AWS</span>
        </div>


        <div class="skill-box">
            <img src="https://img.icons8.com/color/24/terraform.png"/>
            <span class="skill-text">Terraform</span>
        </div>

        <div class="skill-box">
            <img src="https://img.icons8.com/color/24/git.png"/>
            <span class="skill-text">Git</span>
        </div>

        <div class="skill-box">
            <img src="https://img.icons8.com/color/24/docker.png"/>
            <span class="skill-text">Docker</span>
        </div>

        <div class="skill-box">
            <img src="https://img.icons8.com/color/24/kubernetes.png"/>
            <span class="skill-text">Kubernetes</span>
        </div>

        <div class="skill-box">
            <img src="https://img.icons8.com/color/24/ansible.png"/>
            <span class="skill-text">Ansible</span>
        </div>

        <div class="skill-box">
            <img src="https://img.icons8.com/color/24/prometheus-app.png"/>
            <span class="skill-text">Prometheus</span>
        </div>

        <div class="skill-box">
            <img src="https://img.icons8.com/color/24/grafana.png"/>
            <span class="skill-text">Grafana</span>
        </div>

        <div class="skill-box">
            <img src="https://img.icons8.com/?size=24&id=S4wbdK79E23a&format=png&color=000000"/>
            <span class="skill-text">Azure DevOps</span>
        </div>

        <div class="skill-box">
            <img src="https://img.icons8.com/color/24/github.png"/>
            <span class="skill-text">GitHub Actions</span>
        </div>

        <div class="skill-box">
            <img src="https://img.icons8.com/color/24/linux.png"/>
            <span class="skill-text">Linux</span>
        </div>



        <div class="skill-box">
            <img src="https://img.icons8.com/?size=48&id=nSpmkyWqHySy&format=png&color=000000"/>
            <span class="skill-text">IoT</span>
        </div>       
         <div class="skill-box">
            <img src="https://img.icons8.com/color/24/network.png"/>
            <span class="skill-text">Networking</span>
        </div>
        </div>
    </div>
</div>

        <!-- Project 1 -->
        <div class="project-box" onclick="toggleProject('p1')">
            <h4> Automated Cloud VM Deployment and Portfolio Hosting Using Terraform </h4>
            <p> Uses Terraform to automate cloud VM setup, configure a web server, and host a portfolio website with fast, consistent, and scalable deployment. </p>

            <div id="p1" class="project-details">
            <p> project-details 
                <p><b>Tools:</b>  MS Azure (Virtual Networks, Virtual Machine), Terraform, Git </p>
                <p><b>Responsibilities:</b> Deployed cloud Virtual Machines using Terraform (IaC). <br>
                    • Automated infrastructure setup for consistent deployments. <br>
                    • Configured network rules and installed web server. <br>
                    • Hosted and updated a portfolio website on the VM. <br>
                    • Tested, troubleshot, and documented the deployment process. </p>
                <p><b>GitHub:</b> <a href="https://github.com/<github-name>/<repo-name>.git"> View Repo</a></p>
                <img src="https://raw.githubusercontent.com/<github-name>/<repo-name>/main/<image.format>" alt="Project1 Image1">

            </div>
        </div>

        <!-- Project 2 -->
        <div class="project-box" onclick="toggleProject('p2')">
            <h4> Website Hosting Using Micro Services </h4>
            <p> A microservices-based website hosting project where different functionalities (frontend, backend, database) are deployed as independent services, <br> 
                improving scalability, flexibility, and easier maintenance. </p>

            <div id="p2" class="project-details">
            <p> project-details 
                <p><b>Tools:</b> Jenkins, GitHub, Docker</p>
                <p><b>Responsibilities:</b> Pipeline creation, automation</p>
                <p><b>GitHub:</b> <a href="https://github.com/https://github.com/<github-name>/<repo-name>.git"> View Repo </a></p>
                <img src="https://raw.githubusercontent.com/<github-name>/<repo-name>/main/<image.format>" alt="Project2 Image1">
                <img src="https://raw.githubusercontent.com/<github-name>/<repo-name>/main/<image.format>" alt="Project2 Image2">
            </div>
        </div>

    </section>

    <!-- Certifications -->
<section>
    <h3 class="section-title">Certifications</h3>

    <div class="cert-box" onclick="toggleCert(this)">
        • Participated and lead a team in “Cloud Shield DevSecOps Hackathon 2026” organized by V Cube Software Solutions
        <span class="view-link">View Certificate</span>
            <div class="cert-image" id="certImg">
                <img src="https://raw.githubusercontent.com/<github-name>/<repo-name>/main/<image.format>" alt="Certificate">
            </div>
    </div>
</section>

    <!-- Education -->
    <section>
        <h3 class="section-title">Education</h3>
        <p class="section-content">
            B.Tech in Electronics and Communication Engineering | <br>
            abc College of Engineering and Technology
        </p>
    </section>

    <!-- Contact -->
    <section>
        <h3 class="section-title">Contact Me</h3>
        <p class="section-content">
            Email: saibaba@gmail.com <br>
            Github: https://github.com/Saibaba
        </p>
    </section>

</body>
<style>
/* General */
body {
    background-color: white;
    font-family: Arial, sans-serif;
    margin: 20px;
    color: black; /* All text default black */
}

/* Header Layout */
.header {
  height: 33vh;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 40px;
  background: white;
  margin-bottom: 40px; /* MORE GAP after header */
}

/* Left Side */
.left {
  max-width: 70%;
}

/* Right Side */
.right {
  max-width: 30%;
  display: flex;
  justify-content: flex-end;
}

/* Profile Image */
.right .profile {
  width: 100px;
  height: 140px;
  border-radius: 8px;
  object-fit: cover;
}

/* ===== COMMON SECTION ===== */
.section {
    padding: 30px 40px;
    font-size: 18px;
    margin-bottom: 35px; /* MORE GAP between sections */
}

/* ===== HEADINGS ===== */
.heading {
    font-size: 26px;
    font-weight: bold;
    color: black;
    margin-bottom: 5px; /* LESS GAP with content */
}

/* ===== CONTENT TEXT ===== */
.section p,
.section li {
    font-size: 18px;
    color: black;
    margin-top: 5px; /* LESS GAP under heading */
}

/* ===== TEXT STYLES ===== */
.name {
    font-family: Poppins;
    font-size: 32px;
    font-weight: 700;
    color: black;
}

.designation {
    font-family: Poppins;
    font-size: 22px;
    font-weight: 700; /* MADE BOLD */
    color: black;
}

.quote {
    font-family: Poppins;
    font-size: 18px;
    color: black;
}


/* ===== SKILLS ===== */
.skills-container {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}

.skill-box {
    background: #e3f2fd;
    padding: 10px 20px;
    border-radius: 8px;
    font-size: 18px; /* SAME SIZE */
    color: black;
}

/* ===== PROJECT ===== */
.project-box {
    border: 1px solid #ccc;
    padding: 15px;
    margin-top: 25px;
    cursor: pointer;
    transition: 0.3s;
}

.project-box:hover {
    background-color: #f9f9f9;
}

.project-details {
    display: none;
    margin-top: 10px;
}

.project-box.active .project-details {
    display: block;
}

.project-box img {
    width: 100%;
    height: auto;
    display: block;
}

/* ===== CERTIFICATION ===== */
.cert-box {
    border: 1px solid #ccc;
    padding: 10px;
    margin-top: 20px;
    cursor: pointer;
}

.view-link {
    color: blue;
    margin-left: 10px;
}

.cert-image {
    display: none;
    margin-top: 20px;
}

.cert-box.active .cert-image {
    display: block;
}

.cert-image img {
    width: 100%;
    height: auto;
    display: block;
}
</style>
</html>
HTML_EOF
EOF


  tags = {
    Name = "EC2-Sai"
  }
}

