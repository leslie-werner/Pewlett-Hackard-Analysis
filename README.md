# Pewlett-Hackard-Analysis
<!--- Deliverable 3 Requirements

There is a title, and there are multiple sections. (2 pt)
Each section has a heading and subheading. (2 pt)
Links to images are working and displayed correctly. (2 pt)
Analysis (14 points)


Overview of the analysis:The purpose of the new analysis is well defined. (3 pt)
Now that Bobby has proven his SQL chops, his manager has given both of you two more assignments: determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Then, you’ll write a report that summarizes your analysis and helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.
Results:There is a bulleted list with four major points from the two analysis deliverables. (6 pt)
Summary:The summary addresses the two questions and contains two additional queries or tables that may provide more insight. Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
How many roles will need to be filled as the "silver tsunami" begins to make an impact?
Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?(5 pt) ---> 
## Overview: 

The purpose of this analysis was to determine the number of retiring employees per title, as well as, determining the employees who are eligible for the mentorship program. Once the results were obtained, the following questions will be answered: How many roles will need to be filled as the "silver tsunami" and are there enough qualified employees to mentor the next generation?

## Results:

* Retirement Titles
   Retirement Titles table holds all the titles of employees who were born between January 1, 1952 and December 31, 1955. As shown, there are repeating employee numbers due to promotions or moving in the company.
   
   Figure 1. Retirement Titles Table and Code
  <img width="961" alt="retirement_titles_code" src="https://user-images.githubusercontent.com/65638310/152882280-c7cdf84f-b867-405e-b4cc-961759104012.png">


* Unique Titles
  In Figure 2, the retiring employees with their newest title is shown. We also included parameters of employees that are currently working with the company. The date choosen to keep only those dates are equal to '9999-01-01'.
  
  Figure 2. Unique Titles Table and Code
  <img width="1145" alt="unique_titles_code" src="https://user-images.githubusercontent.com/65638310/152882325-d9ab2914-e6eb-48dc-90cf-066defe70aab.png">


* Retiring Titles
  When the analysis was done for retiring titles, we had a total of seven different titles. Senior Engineers had the highest number of retiring titles, and managers had the lowest number of retiring employees.

  
  Figure 3. Retiring Titles Table and Code
  <img width="849" alt="retiring_titles_code" src="https://user-images.githubusercontent.com/65638310/152882309-0de4cd00-a7ed-4def-b875-f648ae8c13e3.png">


* Mentorship Eligibility 
   Mentorship Elgibility for retiring employees is shown in Figure 4. We included parameters with the birthdate between January 1, 1965 and December 31, 1965.
   
  Figure 4. Mentorship Eligibility Table and Code
  <img width="955" alt="mentorship_elgibility code" src="https://user-images.githubusercontent.com/65638310/153716537-18419fc2-9929-42ae-b038-8406a9225ae8.png">

  Figure 4. Mentorship Eligibility Table and Code


## Summary: 

### Summary Questions
* How many roles will need to be filled as the "silver tsunami" begins to make an impact?
*
   There are a total of 41,380 positions that need to be filled. From this total all will be from the following departments: Senior Engineer, Senior Staff, Engineer, Staff, Technique Leader, Assistant Engineer, and Manager.
   
   Figure 5. Count of Total Retiring Employees
   
   <img width="484" alt="count _retiring" src="https://user-images.githubusercontent.com/65638310/152892835-56c69390-a1b2-48c0-8bb3-3778dd41997f.png">

* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
*
Currently, there are enough qualified employees who are retirement-ready who can mentor the next generation for six of the seven departments. Engineering department has the most eligible employees followed by Senior Staff. Shown in figure 6 the lowest amount of eligible employees for the program are assistant engineering.     

   Figure 6. Titles of Retiring Employees Count 
   
   <img width="449" alt="mentorship_titles" src="https://user-images.githubusercontent.com/65638310/153079111-57a286d6-fac9-44bc-938c-272560fa6fe4.png">

### Additional Insight

* Salaries of Retiring Employees 
*
   It is important to find out the salaries of the retiring employees to have a general idea of how budgetting will play out. It will also determine what range new employees will be placed in for pay.
   <img width="892" alt="retiring_salaries" src="https://user-images.githubusercontent.com/65638310/153095191-9cd1fcb2-4fa0-45c5-b798-7092e311e3de.png">

* Salaries of Elgible Employees
   Finding how much each eligible employee for the mentorship program is very important. This will help determine what would be an appropriate pay transitioning to part-time employees. 
   <img width="567" alt="eligible_emp_salaries_code" src="https://user-images.githubusercontent.com/65638310/153095214-10331138-2dc5-4824-aac9-2bac55cc1ab3.png">

   
   
