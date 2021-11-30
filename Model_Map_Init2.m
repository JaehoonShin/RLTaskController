function [myMap N_state N_action N_transition]=Model_Map_Init2(map_name,mapopt)

%% use mapopt='sangwan2012c' only. the other maps are testing version.

% transition prob. for the left(1,1)/right(1,2) action

switch lower(map_name)
    
    %% [random decision(action selection) mode] - (s,a)
    case {'daw2005'}
        
        N_state=5;
        N_action=2; % left/right
        N_transition=3; % depth:  inital, choice1, choice2
        
        myMap.index=1;
        myMap.trial=1;
        myMap.epoch=1;
        myMap.JobComplete=0;
        % MAP: transition prob. for the left(1,1)/right(1,2) action
        prob_seed=1.0;
        prob_seed_mat=[prob_seed 1-prob_seed];
        prob_seed_mat0=[1-prob_seed prob_seed];
        myMap.action(1,1).prob=zeros(N_state,N_state);
        myMap.action(1,2).prob=zeros(N_state,N_state);
        % 1. transition for the left action
        myMap.action(1,1).prob(1,2:3)=prob_seed_mat;
        myMap.action(1,1).prob(2,4:5)=prob_seed_mat;
        % 2. transition for the right action
        myMap.action(1,2).prob(1,2:3)=prob_seed_mat0;
        myMap.action(1,2).prob(2,4:5)=prob_seed_mat0;
        % 3. get a connection matrix
        myMap.action(1,1).connection=double(myMap.action(1,1).prob&ones(N_state,N_state));
        myMap.action(1,2).connection=double(myMap.action(1,2).prob&ones(N_state,N_state));
        % 4. set terminal states
        myMap.IsTerminal=zeros(N_state,1);
        myMap.IsTerminal(3:5)=[1 1 1];
        % 5. reward matrix
        myMap.reward=zeros(N_state,1);
        myMap.reward(3:5)=[0 0 1]; % [0 10 10 0 10 0 25 0 0 25 0 10 10 0 25 0];
        
    case {'glascher2010_old'}
        
        %% to be filled %%
        N_state=(1+4+4*4);
        N_action=2; % left/right
        N_transition=3; % inital, choice1, choice2
        
        myMap.index=1;
        myMap.trial=1;
        myMap.epoch=1;
        % MAP: transition prob. for the left(1,1)/right(1,2) action
        prob_seed=0.7;
        prob_seed_mat=[prob_seed 1-prob_seed];
        myMap.action(1,1).prob=zeros(N_state,N_state);
        myMap.action(1,2).prob=zeros(N_state,N_state);
        % 1. transition for the left action
        myMap.action(1,1).prob(1,2:3)=prob_seed_mat;
        myMap.action(1,1).prob(2,6:7)=prob_seed_mat;
        myMap.action(1,1).prob(3,10:11)=prob_seed_mat;
        myMap.action(1,1).prob(4,14:15)=prob_seed_mat;
        myMap.action(1,1).prob(5,18:19)=prob_seed_mat;
        % 2. transition for the right action
        myMap.action(1,2).prob(1,4:5)=prob_seed_mat;
        myMap.action(1,2).prob(2,8:9)=prob_seed_mat;
        myMap.action(1,2).prob(3,12:13)=prob_seed_mat;
        myMap.action(1,2).prob(4,16:17)=prob_seed_mat;
        myMap.action(1,2).prob(5,20:21)=prob_seed_mat;
        % 3. get a connection matrix
        myMap.action(1,1).connection=double(myMap.action(1,1).prob&ones(N_state,N_state));
        myMap.action(1,2).connection=double(myMap.action(1,2).prob&ones(N_state,N_state));
        % 4. set terminal states
        myMap.IsTerminal=zeros(N_state,1);
        myMap.IsTerminal(6:21)=1;
        % 5. reward matrix
        myMap.reward=zeros(N_state,1);
        myMap.reward(6:21)=[0 10 10 0 10 0 25 0 0 25 0 10 10 0 25 0];        
        
        case {'glascher2010'}
        
        %% to be filled %%
        N_state=8;
        N_action=2; % left/right
        N_transition=3; % inital, choice1, choice2
        
        myMap.index=1;
        myMap.trial=1;
        myMap.epoch=1;
        myMap.JobComplete=0;
        % MAP: transition prob. for the left(1,1)/right(1,2) action
        prob_seed=0.7;
        prob_seed_mat=[prob_seed 1-prob_seed];        
        myMap.action(1,1).prob=zeros(N_state,N_state);
        myMap.action(1,2).prob=zeros(N_state,N_state);
        % 1. transition for the left action
        myMap.action(1,1).prob(1,2:3)=prob_seed_mat;
        myMap.action(1,1).prob(2,7:8)=prob_seed_mat;
        myMap.action(1,1).prob(3,7:8)=[prob_seed_mat(2) prob_seed_mat(1)];
        myMap.action(1,1).prob(4,6)=prob_seed_mat(1);
        myMap.action(1,1).prob(4,8)=prob_seed_mat(2);
        myMap.action(1,1).prob(5,7:8)=[prob_seed_mat(2) prob_seed_mat(1)];
        % 2. transition for the right action
        myMap.action(1,2).prob(1,4:5)=prob_seed_mat;
        myMap.action(1,2).prob(2,7:8)=[prob_seed_mat(2) prob_seed_mat(1)];
        myMap.action(1,2).prob(3,8)=prob_seed_mat(1);
        myMap.action(1,2).prob(3,6)=prob_seed_mat(2);
        myMap.action(1,2).prob(4,7:8)=prob_seed_mat;
        myMap.action(1,2).prob(5,8)=prob_seed_mat(1);
        myMap.action(1,2).prob(5,6)=prob_seed_mat(2);
        % 3. get a connection matrix
        myMap.action(1,1).connection=double(myMap.action(1,1).prob&ones(N_state,N_state));
        myMap.action(1,2).connection=double(myMap.action(1,2).prob&ones(N_state,N_state));
        % 4. set terminal states
        myMap.IsTerminal=zeros(N_state,1);
        myMap.IsTerminal(6:8)=1;
        % 5. reward matrix
        myMap.reward=zeros(N_state,1);
        myMap.reward(6:8)=[25 10 0];
        myMap.reward_prob=zeros(N_state,1);
        myMap.reward_prob(6:8)=[1 1 1]; % reward delivery prob
        
         case {'sangwan2012'}
        
        %% to be filled %%
        N_state=9;
        N_action=2; % left/right
        N_transition=3; % inital, choice1, choice2
        
        myMap.index=1;
        myMap.trial=1;
        myMap.epoch=1;
        myMap.JobComplete=0;
        % MAP: transition prob. for the left(1,1)/right(1,2) action
        prob_seed_mat=mapopt.transition_prob_seed;        % [0.7 0.3];
        myMap.action(1,1).prob=zeros(N_state,N_state);
        myMap.action(1,2).prob=zeros(N_state,N_state);
        % 1. transition for the left action
        myMap.action(1,1).prob(1,[2 3])=prob_seed_mat;
        myMap.action(1,1).prob(2,[7 9])=prob_seed_mat;
        myMap.action(1,1).prob(3,[8 9])=prob_seed_mat;
        myMap.action(1,1).prob(4,[7 9])=prob_seed_mat;
        myMap.action(1,1).prob(5,[6 9])=prob_seed_mat;
        % 2. transition for the right action
        myMap.action(1,2).prob(1,[4 5])=prob_seed_mat;
        myMap.action(1,2).prob(2,[8 7])=prob_seed_mat;
        myMap.action(1,2).prob(3,[7 9])=prob_seed_mat;
        myMap.action(1,2).prob(4,[6 7])=prob_seed_mat;
        myMap.action(1,2).prob(5,[7 9])=prob_seed_mat;
        % 3. get a connection matrix
        myMap.action(1,1).connection=double(myMap.action(1,1).prob&ones(N_state,N_state));
        myMap.action(1,2).connection=double(myMap.action(1,2).prob&ones(N_state,N_state));
        % 3-1. set a level for each node
        myMap.level=[1 2 2 2 2 3 3 3 3];
        % 4. set terminal states
        myMap.IsTerminal=zeros(N_state,1);
        myMap.IsTerminal(6:N_state)=1;
        % 5. reward matrix
        myMap.reward_save=[0 0 0 0 0 40 20 10 0];
        myMap.goal_state_index=[6 7 8];
        myMap.goal_condition_G=[[6 8]; [7 8]; [7 8]; [6 7]; [6 7];]; % output state given as a goal
        myMap.goal_condition_H=[ones(5,1)*[6 7 8 9]];
        myMap.reward=zeros(N_state,1);
        myMap.reward(6:N_state)=mapopt.reward_seed; %[40 20 10 0];
        myMap.reward_prob=zeros(N_state,1);
        myMap.reward_prob(6:N_state)=[1 1 1 1]; % reward delivery prob
        
        case {'sangwan2012b'}
        
        %% to be filled %%
        N_state=9;
        N_action=2; % left/right
        N_transition=3; % inital, choice1, choice2
        
        myMap.index=1;
        myMap.trial=1;
        myMap.epoch=1;
        myMap.JobComplete=0;
        % MAP: transition prob. for the left(1,1)/right(1,2) action
        prob_seed_mat=mapopt.transition_prob_seed;        % [0.7 0.3];
        myMap.action(1,1).prob=zeros(N_state,N_state);
        myMap.action(1,2).prob=zeros(N_state,N_state);
        % 1. transition for the left action
        myMap.action(1,1).prob(1,[2 3])=prob_seed_mat;
        myMap.action(1,1).prob(2,[7 8])=prob_seed_mat;
        myMap.action(1,1).prob(3,[8 9])=prob_seed_mat;
        myMap.action(1,1).prob(4,[7 6])=prob_seed_mat;
        myMap.action(1,1).prob(5,[7 9])=prob_seed_mat;
        % 2. transition for the right action
        myMap.action(1,2).prob(1,[4 5])=prob_seed_mat;
        myMap.action(1,2).prob(2,[8 9])=prob_seed_mat;
        myMap.action(1,2).prob(3,[7 9])=prob_seed_mat;
        myMap.action(1,2).prob(4,[6 9])=prob_seed_mat;
        myMap.action(1,2).prob(5,[9 6])=prob_seed_mat;
        % 3. get a connection matrix
        myMap.action(1,1).connection=double(myMap.action(1,1).prob&ones(N_state,N_state));
        myMap.action(1,2).connection=double(myMap.action(1,2).prob&ones(N_state,N_state));
        % 3-1. set a level for each node
        myMap.level=[1 2 2 2 2 3 3 3 3];
        % 4. set terminal states
        myMap.IsTerminal=zeros(N_state,1);
        myMap.IsTerminal(6:N_state)=1;
        % 5. reward matrix
        myMap.reward_save=[0 0 0 0 0 40 20 10 0];
        myMap.goal_state_index=[6 7 8];
        myMap.goal_condition_G=[[6 8]; [7 8]; [7 8]; [6 7]; [6 7];]; % output state given as a goal
        myMap.goal_condition_H=[ones(5,1)*[6 7 8 9]];
        myMap.reward=zeros(N_state,1);
        myMap.reward(6:N_state)=mapopt.reward_seed; %[40 20 10 0];
        myMap.reward_prob=zeros(N_state,1);
        myMap.reward_prob(6:N_state)=[1 1 1 1]; % reward delivery prob

        
        case {'sangwan2012c'}
        
        %% to be filled %%
        N_state=9;
        N_action=2; % left/right
        N_transition=3; % inital, choice1, choice2
        
        myMap.index=1;
        myMap.trial=1;
        myMap.epoch=1;
        myMap.JobComplete=0;
        % connection information - left:{1,1}, right{1,2}, row: starting state, col: next possible states
        myMap.connection_info{1,1}=[[2 3]; [7 8]; [8 9]; [7 6]; [7 9];]; 
        myMap.connection_info{1,2}=[[4 5]; [8 9]; [7 9]; [6 9]; [9 6];];
        % MAP: transition prob. for the left(1,1)/right(1,2) action
        prob_seed_mat=mapopt.transition_prob_seed;        % [0.7 0.3];
        myMap.action(1,1).prob=zeros(N_state,N_state);
        myMap.action(1,2).prob=zeros(N_state,N_state);
        % 1. transition for the left/right action
        for mm=1:1:2
            for nn=1:1:size(myMap.connection_info{1,mm},1)
                myMap.action(1,mm).prob(nn,myMap.connection_info{1,mm}(nn,:))=prob_seed_mat;
            end
            % 3. get a connection matrix
            myMap.action(1,mm).connection=double(myMap.action(1,mm).prob&ones(N_state,N_state));
        end
        % 3-1. set a level for each node
        myMap.level=[1 2 2 2 2 3 3 3 3];
        % 4. set terminal states
        myMap.IsTerminal=zeros(N_state,1);
        myMap.IsTerminal(6:N_state)=1;
        % 5. reward matrix
        myMap.reward_save=[0 0 0 0 0 40 20 10 0];
        myMap.goal_state_index=[6 7 8];
        myMap.goal_condition_G=[[6 8]; [7 8]; [7 8]; [6 7]; [6 7];]; % output state given as a goal
        myMap.goal_condition_H=[ones(5,1)*[6 7 8 9]];
        myMap.reward=zeros(N_state,1);
        myMap.reward(6:N_state)=mapopt.reward_seed; %[40 20 10 0];
        myMap.reward_prob=zeros(N_state,1);
        myMap.reward_prob(6:N_state)=[1 1 1 1]; % reward delivery prob
        

        case {'jaehoon2018'}
        
        %% to be filled %%
        N_state=9;
        N_action=2; % left/right
        N_transition=3; % inital, choice1, choice2
        
        myMap.index=1;
        myMap.trial=1;
        myMap.epoch=1;
        myMap.JobComplete=0;
        % connection information - left:{1,1}, right{1,2}, row: starting state, col: next possible states
        myMap.connection_info{1,1}=[[2 3]; datasample(6:9,2,'Replace',false); datasample(6:9,2,'Replace',false); datasample(6:9,2,'Replace',false); datasample(6:9,2,'Replace',false); ]; 
        myMap.connection_info{1,2}=[[4 5]; datasample(6:9,2,'Replace',false); datasample(6:9,2,'Replace',false); datasample(6:9,2,'Replace',false); datasample(6:9,2,'Replace',false); ];
%         disp([myMap.connection_info{1,1}'; myMap.connection_info{1,2}'])
        % MAP: transition prob. for the left(1,1)/right(1,2) action
        prob_seed_mat=mapopt.transition_prob_seed;        % [0.7 0.3];
        myMap.action(1,1).prob=zeros(N_state,N_state);
        myMap.action(1,2).prob=zeros(N_state,N_state);
        % 1. transition for the left/right action
        for mm=1:1:2
            for nn=1:1:size(myMap.connection_info{1,mm},1)
                myMap.action(1,mm).prob(nn,myMap.connection_info{1,mm}(nn,:))=prob_seed_mat;
            end
            % 3. get a connection matrix
            myMap.action(1,mm).connection=double(myMap.action(1,mm).prob&ones(N_state,N_state));
        end
        % 3-1. set a level for each node
        myMap.level=[1 2 2 2 2 3 3 3 3];
        % 4. set terminal states
        myMap.IsTerminal=zeros(N_state,1);
        myMap.IsTerminal(6:N_state)=1;
        % 5. reward matrix
        myMap.reward_save=[0 0 0 0 0 40 20 10 0];
        myMap.goal_state_index=[6 7 8];
        myMap.goal_condition_G=[[6 8]; [7 8]; [7 8]; [6 7]; [6 7];]; % output state given as a goal
        myMap.goal_condition_H=[ones(5,1)*[6 7 8 9]];
        myMap.reward=zeros(N_state,1);
        myMap.reward(6:N_state)=mapopt.reward_seed; %[40 20 10 0];
        myMap.reward_prob=zeros(N_state,1);
        myMap.reward_prob(6:N_state)=[1 1 1 1]; % reward delivery prob
        
        case {'jaehoon2020'}
        
        %% to be filled %%
        N_state=9;
        N_action=2; % left/right
        N_transition=3; % inital, choice1, choice2
        
        myMap.index=1;
        myMap.trial=1;
        myMap.epoch=1;
        myMap.JobComplete=0;
        % connection information - left:{1,1}, right{1,2}, row: starting state, col: next possible states
        myMap.connection_info{1,1}=[[2 3]; datasample(6:9,2,'Replace',false); datasample(6:9,2,'Replace',false); datasample(6:9,2,'Replace',false); datasample(6:9,2,'Replace',false); ]; 
        myMap.connection_info{1,2}=[[4 5]; datasample(6:9,2,'Replace',false); datasample(6:9,2,'Replace',false); datasample(6:9,2,'Replace',false); datasample(6:9,2,'Replace',false); ];
%         disp([myMap.connection_info{1,1}'; myMap.connection_info{1,2}'])
        % MAP: transition prob. for the left(1,1)/right(1,2) action
        prob_seed_mat=mapopt.transition_prob_seed;        % [0.7 0.3];
        myMap.action(1,1).prob=zeros(N_state,N_state);
        myMap.action(1,2).prob=zeros(N_state,N_state);
        % 1. transition for the left/right action
        for mm=1:1:2
            for nn=1:1:size(myMap.connection_info{1,mm},1)
                myMap.action(1,mm).prob(nn,myMap.connection_info{1,mm}(nn,:))=prob_seed_mat;
            end
            % 3. get a connection matrix
            myMap.action(1,mm).connection=double(myMap.action(1,mm).prob&ones(N_state,N_state));
        end
        % 3-1. set a level for each node
        myMap.level=[1 2 2 2 2 3 3 3 3];
        % 4. set terminal states
        myMap.IsTerminal=zeros(N_state,1);
        myMap.IsTerminal(6:N_state)=1;
        % 5. reward matrix
        myMap.reward_save=[0 0 0 0 0 40 20 10 0];
        myMap.goal_state_index=[6 7 8];
        myMap.goal_condition_G=[[6 8]; [7 8]; [7 8]; [6 7]; [6 7];]; % output state given as a goal
        myMap.goal_condition_H=[ones(5,1)*[6 7 8 9]];
        myMap.reward=zeros(N_state,1);
        myMap.reward(6:N_state)=mapopt.reward_seed; %[40 20 10 0];
        myMap.reward_prob=zeros(N_state,1);
        myMap.reward_prob(6:N_state)=[1 1 1 1]; % reward delivery prob
        myMap.visited_goal_state = 1;
end

end