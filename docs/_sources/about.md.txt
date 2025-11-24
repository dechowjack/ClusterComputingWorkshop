# About the Cluster Computing Workshop

This workshop provides a set of written guides, tutorials, and example scripts designed to introduce researchers to working effectively on a remote compute cluster. The materials were originally developed for the Pavelsky Global Hydrology Lab at UNC Chapel Hill, where new group members often needed a structured onboarding path for using the EMES **River** cluster. However, the content is broadly applicable to any Linux-based HPC system that uses Slurm.

The workshop is aimed at researchers with a wide range of technical experience. Many sections assume no prior exposure to high-performance computing or remote Unix environments. 
---

## What this workshop contains

The repository includes:

### **Written Guides**

The primary learning modules are provided as Markdown documents, each focused on a core skill:

- **P1_Basics.md**  
  An introduction to command-line fundamentals, Unix-based operating systems, and connecting to a remote machine with `ssh`.

- **P2_Slurm.md**  
  A beginner-friendly overview of the Slurm job management system: partitions, job submission, monitoring, and interpreting job states.

- **P3 and beyond**  
  Additional modules follow the naming pattern `P#_Topic.md`, introducing more advanced cluster workflows as the workshop grows.

### **Reference Sheets**

Concise cheat-sheets summarize commonly used commands, flags, Slurm directives, and job status codes. These are intended as quick look-up aids during day-to-day work.

### **Example Scripts**

The repository includes example shell scripts and job files demonstrating how to structure tasks on a cluster. These are designed as templates readers can adapt to their own workflows.

---

## Goals and design philosophy

This workshop was designed with three core goals:

1. **Accessibility**  
   New cluster users often feel overwhelmed by unfamiliar commands, scheduler terminology, and strict filesystem rules. The guides emphasize clarity, practical examples, and step-by-step instructions.

2. **Transferability**  
   While the guides include notes tailored to the EMES River cluster at UNC, every effort is made to separate general HPC best practices from system-specific details. Users from other institutions should find the materials broadly relevant.

3. **Reproducibility**  
   Using a cluster effectively is a foundational part of building reproducible scientific workflows. The workshop encourages version control, organized project structure, and consistent job scripting practices.

---

## Future Development

This workshop continues to evolve. Planned additions include:

- Expanded modules on multi-step workflows, job arrays, environment modules, and Python virtual environments  
- Additional reference sheets tailored to specific research contexts  

Contributions, suggestions, or issue reports are always welcome through the GitHub repository.

---

## Citation and Contact

If you wish to reference or reuse these materials in your lab or classroom, you may cite the workshop as:

> *Cluster Computing Workshop, developed by Jack Dechow for the Pavelsky Global Hydrology Lab, UNC Chapel Hill.*  
> Repository: <https://github.com/dechowjack/ClusterComputingWorkshop>  
> Website: <https://dechowjack.github.io/ClusterComputingWorkshop/>

For questions or suggestions, feel free to open an issue or reach out to Jack (jldechow@unc.edu)