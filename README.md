# resume_builder

Add all of your experience, qualifications, projects, etc. and quickly create customized resumes for different positions.



## Creating compatible LaTeX templates

In this app, each of the different components (section, job, project, etc.) expects to have its own custom latex command when it creates the new TeX file. The process of creating a new TeX file is:

1. Copy the template file into a new file.
2. Call `toLaTeX()` to append the custom commands with the appropriate information, surrounded by `\begin{document}` and `\end{document}` to the new file.

So each new template needs to implement the following commands:

- `\{resumeHeader}[4]`
    1. Full Name
    2. Phone Number
    3. Email Address
    4. Link's

- `\{resumeLink}[2]`
    1. Link
    2. Text



## TODO

- The current header link and project skill implementations are too rigid and cannot be changed in new templates.