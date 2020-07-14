# プレイヤー(自分)に「0 ~ 2」を入力させる
class Player
  def hand
    puts '-------------------------'
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    while true

      # 入力された数字を取得
      input_hand = gets.chomp
      # 数字を返す処理
      if input_hand == '0'
        return input_hand.to_i
        break
      elsif input_hand == '1'
        return input_hand.to_i
        break
      elsif input_hand == '2'
        return input_hand.to_i
        break
      else
        puts '0~2の数字を入力してください'
        puts '0:グー, 1:チョキ, 2:パー'
      end
    end
  end
end
# 敵が「0 ~ 2」の値をランダムで生成する
class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力させます。
    hands = [0, 1, 2]
    hands.sample
  end
end
# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力する
class Janken
  def pon(player_hand, enemy_hand)
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    puts '-------------------------'
    puts "相手の手は#{janken[enemy_hand]}です。"
    puts '-------------------------'

    if player_hand == enemy_hand
      puts '結果：あいこ'
      return true
    elsif (player_hand - enemy_hand + 3) % 3 == 2
      puts '結果：あなたの勝ちです'
      return false
    elsif (player_hand - enemy_hand + 3) % 3 == 1
      puts '結果：あなたの負けです'
      return false
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

next_game = ''
while next_game
  # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
  next_game = janken.pon(player.hand, enemy.hand)
end
