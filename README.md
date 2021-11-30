# RLTaskController_human

This work was supported by Institute for Information & communications Technology Promotion(IITP) grant funded by the Korea government(MSIT) (No.2019-0-01371, Development of brain-inspired AI with human-like intelligence) and Samsung Research Funding Center of Samsung Electronics under Project Number SRFC-TC1603-52.

#How to use

1. Install Matlab >= 2020 version
2. Install Psychotoolbox package
3. Open the task_main_2020.m file
4. Modify following values
  - sess_opt : 'pre' or 'fmri'
  - sess_num : 1 / 1~5(max) for each 'pre'/'fmri' conditions
  - name : any character string
  - image_seed : 1~5
5.Run the task_main_2020.m

# Potential problems
1. The display screen works incorrectly
  - Modify 'whichScreen' in the SIMUL_arbiteration_fmri_rpe.m

# papers
1.Shin, Jae Hoon, et al. "Designing Model-Based and Model-Free Reinforcement Learning Tasks without Human Guidance." 33rd Conference on Neural Information Processing Systems (NeurIPS 2019). Neural Information Processing Systems Foundation, 2019.
2.Shin, Jae Hoon, et al. "Deep Interaction between Reinforcement Learning Algorithms and Human Reinforcement Learning." 2020 한국인공지능학회 하계학술대회. (사) 한국인공지능학회, 2020
3.Shin, Jae Hoon, et al. "Deep Interaction between Reinforcement Learning Algorithms and Human Reinforcement Learning."  FROM NEUROSCIENCE TO ARTIFICIALLY INTELLIGENT SYSTEMS (NAISys), 2020.
4.Shin, Jae Hoon, et al. "In silico manipulation of human cortical computation underlying goal-directed learning." 35th Conference on Neural Information Processing Systems (NeurIPS 2021). Neural Information Processing Systems Foundation, 2021.

# references
1. Lee, Sang Wan, Shinsuke Shimojo, and John P. O’Doherty. "Neural computations underlying arbitration between model-based and model-free learning." Neuron 81.3 (2014): 687-699.
