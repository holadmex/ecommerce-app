import os

list_of_paths = [
    f"iac-setup/main.tf",
    f"iac-setup/variables.tf",
    f"iac-setup/users.tf",
    f"iac-setup/groups.tf",
    f"iac-setup/accounts.tf",
    f"iac-setup/local.tf",
    f"iac-setup/permission-sets.tf",
    f"iac-setup/assignments.tf",
    f"iac-setup/outputs.tf", 
    f"iac-setup/dev.tfvars",
]

for path in list_of_paths:
    if path.endswith("/"):  
        os.makedirs(path, exist_ok=True)
    else:
        dir_path = os.path.dirname(path)
        if dir_path:
            os.makedirs(dir_path, exist_ok=True)
        with open(path, 'w') as f:
            f.write("")  

print(f"{list_of_paths} - Directories and files have been created.")



import os

project_name = "pyhton_test"

list_of_paths = [
    ".github/workflows/ci-cd.yaml",
    "Dockerfile",
    ".env",
    f"src/{project_name}/frontend/",
    f"src/{project_name}/frontend/index.html",
    f"src/{project_name}/frontend/style.css",
    f"src/{project_name}/frontend/script.js",
    f"src/{project_name}/backend/"
]

for path in list_of_paths:
    if path.endswith("/"):  
        os.makedirs(path, exist_ok=True)
    else:
        dir_path = os.path.dirname(path)
        if dir_path:
            os.makedirs(dir_path, exist_ok=True)
        with open(path, 'w') as f:
            f.write("")  

print(f"{list_of_paths} - Directories and files have been created.")



# import os


# list_of_paths = [
#     f"iac-setup/main.tf",
#     f"iac-setup/variables.tf",
#     f"iac-setup/vpc.tf",
#     f"iac-setup/security_groups.tf",
#     f"iac-setup/rds.tf",
#     f"iac-setup/ec2.tf",
#     f"iac-setup/ecr.tf",
#     f"iac-setup/iam.tf",
#     f"iac-setup/cloudwatch.tf",
#     f"iac-setup/alb.tf",
#     f"iac-setup/ecs.tf",
#     f"iac-setup/outputs.tf", 
#     f"iac-setup/backend.tf",
#     f"iac-setup/environments/dev.tfvars",
#     f"iac-setup/environments/stage.tfvars",
#     f"iac-setup/environments/prod.tfvars"
# ]

# for path in list_of_paths:
#     if path.endswith("/"):  
#         os.makedirs(path, exist_ok=True)
#     else:
#         dir_path = os.path.dirname(path)
#         if dir_path:
#             os.makedirs(dir_path, exist_ok=True)
#         with open(path, 'w') as f:
#             f.write("")  

# print(f"{list_of_paths} - Directories and files have been created.")


# def calculate_average(numbers):
#     """
#     Calculate the average of a list of numbers.
    
#     Args:
#         numbers (list): A list of numbers
        
#     Returns:
#         float: The average of the numbers
#     """
#     if not numbers:  # Check if the list is empty
#         return 0
    
#     total = sum(numbers)
#     count = len(numbers)
#     average = total / count
    
#     return average

# # Using the function
# test_scores = [85, 90, 78, 92, 88]
# average_score = calculate_average(test_scores)
# print(f"The average score is: {average_score}")  # Output: The average score is: 86.6
