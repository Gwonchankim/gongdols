function snake_game
% �������� ����������Ʈ
% 2019�� 5�� 27��
%
% ������: F5 ������
% �����ϴ� ��: ����Ű ���... �ڼ��� ������ ����
%

figure;
set(gcf,'color','w');

XLIMs = [-25,25];
YLIMs = [-25,25];

bodies = [1,0;0,0]; % initializing the location of the body

set(gcf,'KeyPressFcn',@no_command_window); % command window���� key �Է��� ��ٸ��� �ʰ�...

food_x = round(rand(1)*48-24);
food_y = round(rand(1)*48-24);
h_dead = false;

%% BGM
% https://freesound.org/people/Sirkoto51/sounds/393818/
[y, Fs] = audioread('bgm.wav');
player_bgm = audioplayer(y, Fs);
play(player_bgm)

%% item sound effect
% https://freesound.org/people/Scrampunk/sounds/345297/
[y_item,Fs_item] = audioread('item.wav');
player_item = audioplayer(y_item, Fs_item);

%% Dying BGM
% https://freesound.org/people/TolerableDruid6/sounds/458251/
[y_dead,Fs_dead] = audioread('dead.wav');
player_dead = audioplayer(y_dead, Fs_dead);

while(1)
    %% dying condition1 (���� �ε����� ��)
    if bodies(1,1)>XLIMs(2) || bodies(1,1)<XLIMs(1)
        h_dead = true;
    elseif bodies(1,2)>YLIMs(2) || bodies(1,2)<YLIMs(1)
        h_dead = true;
    end
    
    %% memorizing the past
    past_bodies = bodies(1:end-1,:);
    
    %% moving
    drt = get(gcf,'CurrentKey');
    
    if strcmp(drt,'rightarrow')
        bodies(1,1) = bodies(1,1)+1;
    elseif strcmp(drt,'leftarrow')
        bodies(1,1) = bodies(1,1)-1;
    elseif strcmp(drt,'uparrow')
        bodies(1,2) = bodies(1,2)+1;
    elseif strcmp(drt,'downarrow')
        bodies(1,2) = bodies(1,2)-1;
    else
        bodies(1,1) = bodies(1,1)+1;
    end
    
    % connecting the head to the bodies of past
    bodies(2:end,:)=past_bodies;
    
    %% dying condition2 (���뿡 �ε����� ��)
    for i=2:size(bodies,1)
        if isequal(bodies(1,1),bodies(i,1)) && isequal(bodies(1,2),bodies(i,2))
            h_dead = true;
        end
    end
    
    
    %% ���̸� �Ծ��ٸ� ������ ��ġ�� �ű�� ���̸� �÷���� ��.
    if abs(bodies(1,1)-food_x)<1.5 && abs(bodies(1,2)-food_y)<1.5
        play(player_item);
        
        bodies = [[food_x,food_y]; bodies];
        
        food_x = round(rand(1)*48-24);
        food_y = round(rand(1)*48-24);
    end
    
    
    %% plotting
    plot(bodies(:,1), bodies(:,2),'s','markerfacecolor','b','markersize',10);
    hold on
    plot(food_x, food_y, 'o', 'markerfacecolor','r','markersize',15);
    xlim(XLIMs);
    ylim(YLIMs);
    grid on;
    %% �׾���?
    if h_dead
        play(player_dead);
%         stop(player_bgm)
        pause(1)
        t = text(0,0,'You died','HorizontalAlignment','center');
        t.Color = 'r';
        t.FontSize = 80;
        break;
    end
    
    drawnow
    cla
end

end

function no_command_window(src,event)
end