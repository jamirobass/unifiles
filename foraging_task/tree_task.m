%opening screen
%HideCursor
%[windowPt, rect]=Screen('bla', windowPtrOrScreenNumber[,color][,rect]
%[,pixelSize][,numberofBuffers][,stereomode][,multisample][,imaginmode]
%[,specialFlags][,clientRect]);
%------------------------  Experimental parameters ----------------------%
%tR = tree richness
%tRStd = tree richness std
%k = depletion rate
%kstd = depletion rate std
%stdr = reward stdr
%h = harvest time 
%d = travel time 

tR = [10 10 10 10 10 10 10 10];
trStd = [0 0 0 0 1 1 1 1];
k = [.85, .85, .68, .89, .88, .94, .88, .94];
kstd = [0, 0, 0, 0, .07, .07, .07, .07];
stdr = [.18, .18, .37, .13, 0, 0, 0, 0];
h = [4.5, 4.5, 4.5, 4.5, 3, 3, 3, 3];
d = [13.5, 4.5, 9, 9, 9, 9, 6, 6];

%------------------------  Variables ----------------------%

responseKey = cell(1000,1);
responseTime = NaN(1000, 1);



%------------------------  Matrix loops ----------------------%
%Create all the maps
for i = 1:8
    [rewardMap{i}, decreaseMap{i}] = createMap(...
        tR(i), trStd(i), k(i), kstd(i), stdr(i));
end
%------------------------  Plots ----------------------%
%Plot the maps
ax1=subplot(2,2,1);
plot(rewardMap{1}(1:10,1:10));
title('1A: Travel')
ax2=subplot(2,2,2);
plot(rewardMap{2}(1:10,1:10));
title('1A: Travel')
ax3=subplot(2,2,3);
plot(rewardMap{3}(1:10,1:10));
title('1B: Steep Depletion')
ax4=subplot(2,2,4);
plot(rewardMap{4}(1:10,1:10));
title('1B: shallow Depletion')
linkaxes([ax1,ax2,ax3, ax4],'xy')
%------------------------  Task 1A ----------------------%
%1.5 sec stimulus display (no kb act allowed)
%black fixation cross, make choice, 1.5 sec max time
%if over max time: "Time out" msg for 3 sec 
%if exploit: wait secs animation(?) + show reward (1.5 sec) 
%if explore: wait secs animation(?) + swap tree + show reward(0) (1.5 sec)
%inter trial w8 time normrnd 2 sec (investigating pupil dilation in decision research)


tree = imread('tree.jpg');
cross = imread('cross.jpg');
%VBLSyncTest
[windowPtr, rect] = Screen('OpenWindow', 0, [127 127 127],...
    [960 540 1920 1080]);
%Draw tree
treeTexture = Screen('MakeTexture',windowPtr , tree);
Screen('DrawTexture', windowPtr, treeTexture);
Screen('Flip', windowPtr);
WaitSecs(0.5); %actual = 1.5 sec 
%Draw fix cross 
crossTexture = Screen('MakeTexture', windowPtr, cross);
Screen('DrawTexture', windowPtr, crossTexture);
Screen('Flip', windowPtr);
KbWait 
WaitSecs(1);
Screen('CloseAll');

%To get key pressed and rt
t1 = GetSecs;
time = 0;
while time < 3
    [keyIsDown, t2, keyCode] = KbCheck;
    time = t2-t1;
    if (keyIsDown)
        key = KbName(find(keyCode));
        responseKey{1} = key;
        responseTime(1) = time;
        break;        
    end
end 
