def game
  until judge()
  end
end

def judge
  #じゃんけんの結果
  #じゃんけんで勝敗が決まらない時はもう一度じゃんけん
  rock_paper_scissors_result = rock_paper_scissors()
  if rock_paper_scissors_result == 2
    return false
  elsif rock_paper_scissors_result == 1
    return true
  end
  #あっち向いての結果
  #あっちむいてで勝敗が決まらない時はここでfalseを返し再度じゃんけんへ
  if !facing_over_there()
    puts "もう一度じゃんけんへ"
    return false
  end
  
  #じゃんけんの結果による判定
  if rock_paper_scissors_result == 3
    puts "あなたの勝ちです"
  else 
    puts "あなたの負けです。"
  end
  return true  
end

def rock_paper_scissors
  puts "じゃんけん..."
  puts "0(グー)　１(チョキ)　２(パー)　３(戦わない)"
  player_select = gets.to_i
  cpu_select = rand(2)
  hands = ["グー","チョキ","パー"]
  result = 0
  puts "ポイッ！！"
  if player_select <= 2
  puts "=============="
  puts "自分" + hands[player_select]
  puts "相手" + hands[cpu_select]
  puts  "=============="
  else
    puts  "戦わない"
  end
  
  if player_select == 3
    puts "お前はじゃんけんの敗北者じゃけえのう"
    result = 1
  elsif player_select == cpu_select
    puts"あいこです。もう一度！"
    result = 2
  elsif player_select < cpu_select || player_select == 2 && cpu_select == 0
    puts "あっち向いてホイ（自分）"
    result = 3
  elsif cpu_select < player_select || cpu_select == 2 && player_select == 0
    puts "あっち向いてホイ（相手）"
  end
  return result
end

#あっちむいてほいのメソッド
def facing_over_there
  puts "あっち向いて〜"
  player_direction = gets.to_i
  cpu_direction = rand(3)
  direction = ["上","下","右","左"]
  puts "上(0) 下(1) 右(2) 左(3)"
  puts "ポイッ！"
  puts "=============="
  puts "自分　"+ direction[player_direction]
  puts "相手　"+ direction[cpu_direction]
  puts "=============="
  return (player_direction == cpu_direction)
end

game()