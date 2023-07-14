class Rock_paper_scissors_game
  def initialize
    @@hands = ["グー", "パー" , "チョキ"]
    @@directions = ["↑", "↓", "←", "→"]
    @count = {win: 0, lose: 0, draw: 0}
    puts "-----------------------------"
    puts "START 0 / QUIT 1"
    puts "-----------------------------"
  end
  
  def get_hands
    return @@hands
  end
  
  def get_directions
    return @@directions
  end
  
  def put_count
    puts @count
  end
  
  def start #ゲームスタート
    puts "-----------------------------"
    puts "じゃんけん..."
    puts "グー 0 / パー 1 / チョキ 2"
    puts "-----------------------------"
  end 
  
  def restart #あいこ時リスタート
    puts "-----------------------------"
    puts "あいこで..."
    puts "グー 0 / パー 1 / チョキ 2"
    puts "-----------------------------"
  end
  
  def select_hand_numbers(i) #じゃんけん、あっち向いてホイの手を決める
    my_hand_number = Random.rand(i)
    your_hand_number = gets.to_i
    hand_numbers = {"相手": my_hand_number, "あなた": your_hand_number}
    return hand_numbers
  end 
  
  def display_hands(hash, array) #じゃんけん,あっち向いてホイの手を表示する
    hash.each do |key, value|
      puts "#{key}：#{array[value]}"
    end 
  end
  
  def judge(hash) #じゃんけんの判定をする
    if hash[:"相手"] == hash[:"あなた"] then
      return "draw"
    else 
      if hash[:"相手"] == 0 then     #相手がグー
        if hash[:"あなた"] == 1
          return "you won"
        else
          return "you lost"
        end
      elsif hash[:"相手"] == 1 then   #相手がパー
        if hash[:"あなた"] == 0 then
          return "you lost"
        else
          return "you won"
        end
      else                 #相手がチョキ
        if hash[:"あなた"] == 0 then
          return "you won"
        else
          return "you lost"
        end
      end 
    end
  end

  def  look_over_start  #あっち向いてホイスタート
    puts "-----------------------------"
    puts "あっち向いて..."
    puts "↑ 0 / ↓ 1 / ← 2 / → 3"
    puts "-----------------------------"
  end
  
  def judge_look_over_w(hash)  #ジャンケンで勝った時の判定
    if hash[:"相手"] == hash[:"あなた"]
      @count[:win] += 1
      return "you won"
    else 
      @count[:draw] += 1
      return "draw"
    end
  end
  
  def judge_look_over_l(hash)  #ジャンケンで負けた時の判定
    if hash[:"相手"] == hash[:"あなた"]
      @count[:lose] += 1
      return "you lost"
    else 
      @count[:draw] += 1
      return "draw"
    end
  end
  
  def quit
    puts "-----------------------------"
    puts "終了します"
    puts "-----------------------------"
  end
  
end 

#インスタンス生成
game = Rock_paper_scissors_game.new
game_number = gets.to_i

until game_number == 1 do 
  if game_number == 0
    #じゃんけん開始
    game.start
    hand_numbers = game.select_hand_numbers(3)
    hands = game.get_hands
    until hand_numbers[:"あなた"] == 0 || hand_numbers[:"あなた"] == 1 || hand_numbers[:"あなた"] == 2 do
      puts "入力が正しくありません"
      game.start
      hand_numbers = game.select_hand_numbers(3)
    end
    game.display_hands(hand_numbers, hands)
    judgement = game.judge(hand_numbers)
    while judgement == "draw" do
      game.restart
      hand_numbers = game.select_hand_numbers(3)
      until hand_numbers[:"あなた"] == 0 || hand_numbers[:"あなた"] == 1 || hand_numbers[:"あなた"] == 2 do
        puts "入力が正しくありません"
        game.restart
        hand_numbers = game.select_hand_numbers(3)
      end
      game.display_hands(hand_numbers, hands)
      judgement = game.judge(hand_numbers)
    end
    #あっち向いてホイ開始
    game.look_over_start
    if judgement == "you won" then
      puts "指を指す方向を入力"
      look_over_numbers = game.select_hand_numbers(4)
      until look_over_numbers[:"あなた"] == 0 || look_over_numbers[:"あなた"] == 1 || look_over_numbers[:"あなた"] == 2|| look_over_numbers[:"あなた"] == 3 do
        puts "入力が正しくありません"
        game.look_over_start
        puts "指を指す方向を入力"
        look_over_numbers = game.select_hand_numbers(4)
      end
      directions = game.get_directions
      game.display_hands(look_over_numbers, directions) 
      judgement_lool_over = game.judge_look_over_w(look_over_numbers)
    else
      puts "振り向く方向を入力"
      look_over_numbers = game.select_hand_numbers(4)
      until look_over_numbers[:"あなた"] == 0 || look_over_numbers[:"あなた"] == 1 || look_over_numbers[:"あなた"] == 2|| look_over_numbers[:"あなた"] == 3 do
        puts "入力が正しくありません"
        game.look_over_start
        puts "振り向く方向を入力"
        look_over_numbers = game.select_hand_numbers(4)
      end
      directions = game.get_directions
      game.display_hands(look_over_numbers, directions)
      judgement_lool_over = game.judge_look_over_l(look_over_numbers)
    end 
    puts judgement_lool_over
    game.put_count
    puts "-----------------------------"
    puts "CONTINUE 0  QUIT 1"
    puts "-----------------------------"
    game_number = gets.to_i
  else
    puts "入力が正しくありません"
    puts "-----------------------------"
    puts "CONTINUE 0  QUIT 1"
    puts "-----------------------------"
    game_number = gets.to_i
    
  end
  
end

game.quit