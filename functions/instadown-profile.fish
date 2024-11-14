function instadown-profile
  instaloader --login=kojirou1994 \
    --stories --highlights --tagged --reels --igtv --comments --geotags \
    --filename-pattern={owner_username}_{date_utc}_UTC \
    $argv
end

function instadown-post
  for post in $argv
    instaloader --login=kojirou1994 \
      --stories --highlights --tagged --reels --igtv --comments --geotags \
      --dirname-pattern=post --filename-pattern={owner_username}_{date_utc} \
      -- -$post
  end
end