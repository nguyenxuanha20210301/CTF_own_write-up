i see this keygenme file:
key_part_static1_trial = "picoCTF{1n_7h3_|<3y_of_"
key_part_dynamic1_trial = "xxxxxxxx"
key_part_static2_trial = "}"

so my mission is to find value of key_part_dynamic1_trial 
part1: 
 
    if check_key(user_key, bUsername_trial):
        decrypt_full_version(user_key)

part2: 
  def check_key(key, username_trial):

    global key_full_template_trial

    if len(key) != len(key_full_template_trial):
        return False
    else:
        # Check static base key part --v
        i = 0
        for c in key_part_static1_trial:
            if key[i] != c:
                return False

            i += 1

        # TODO : test performance on toolbox container
        # Check dynamic part --v


  part 3: 
  
   if key[i] != hashlib.sha256(username_trial).hexdigest()[4]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[5]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[3]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[6]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[2]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[7]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[1]:
            return False
        else:
            i += 1

        if key[i] != hashlib.sha256(username_trial).hexdigest()[8]:
            return False



        return True

this code hint me to: key ~ key_part_dynamic1_trial = hashlib.sha256(username_trial ).hexdigest()[45362718]
      usename_trial is 'GOUGH'

  In linux, I run file 
springriver@alittlerock:~/Downloads/picoCTF$ cat key_user_trial.py 
import hashlib
username_trial = "GOUGH"
result  = hashlib.sha256(username_trial.encode()).hexdigest()
print(result)

springriver@alittlerock:~/Downloads/picoCTF$ python3 key_user_trial.py 
e8a1f9146d32473b9605568ca66f7b5c2db9f271f57a8c8e9e121e48accddf2f -> that is encode of (usename_trial) -> key: f911a486

so my flag is: picoCTF{1n_7h3_|<3y_of_f911a486}



