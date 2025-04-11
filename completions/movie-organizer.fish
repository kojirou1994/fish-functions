function __fish_movie-organizer_using_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq (count $argv) ]
        for i in (seq (count $argv))
            if [ $cmd[$i] != $argv[$i] ]
                return 1
            end
        end
        return 0
    end
    return 1
end
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l output -s o -d 'Output directory'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l mode -s m -d 'Work mode, movie or series'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer --mode' -f -k -a 'series movie'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer -m' -f -k -a 'series movie'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l imdb-id -d 'imdbID'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l tvdb-id -d 'tvdbID'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l tag -d 'Tag for inputs'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l edition -d 'Edition for inputs'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l maker -d 'Maker for inputs'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l process -d 'Process method for inputs, available: Raw, Remux, Encoded'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer --process' -f -k -a 'Raw Remux Encoded'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l source -d 'Source for inputs, available: WEB-DL, WEB-RIP, DigitalTV, TV-RIP, DVD, Blu-Ray'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer --source' -f -k -a 'WEB-DL WEB-RIP DigitalTV TV-RIP DVD Blu-Ray'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l film-format -d 'Film format for inputs, available: IMAX'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer --film-format' -f -k -a 'IMAX'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l hdr -d 'Force set HDR type, available: hlg, hdr10, hdr10Plus, dolbyVision'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer --hdr' -f -k -a 'hlg hdr10 hdr10Plus dolbyVision'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l mark-border -d 'Border for mark generating'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l service -d 'The movie database service name, default service is depended on work mode, available: tvdbV3, tvdbV4, omdb, moviedbV3'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer --service' -f -k -a 'tvdbV3 tvdbV4 omdb moviedbV3'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l pattern -s p
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l pattern-preset
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer --pattern-preset' -f -k -a 'movie series animeMovie'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l season -d 'Season number for series input'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l season-title -d 'Season\'s subtitle'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -l move-misc -d 'Move misc files'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -l no-move-misc -d 'Move misc files'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -l organize-stuff -d 'Organize media\'s same filename files'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -l no-organize-stuff -d 'Organize media\'s same filename files'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -r -l language -s l -d 'Language for database api'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer --language' -f -k -a 'abk ace ach ada ady afa afh afr ain aka akk alb ale alg alt amh ang anp apa ara arc arg arm arn arp art arw asm ast ath aus ava ave awa aym aze bad bai bak bal bam ban baq bas bat bej bel bem ben ber bho bih bik bin bis bla bnt bos bra bre btk bua bug bul bur byn cad cai car cat cau ceb cel cha chb che chg chi chk chm chn cho chp chr chu chv chy cmc cnr cop cor cos cpe cpf cpp cre crh crp csb cus cze dak dan dar day del den dgr din div doi dra dsb dua dum dut dyu dzo efi egy eka elx eng enm epo est ewe ewo fan fao fat fij fil fin fiu fon fre frm fro frr frs fry ful fur gaa gay gba gem geo ger gez gil gla gle glg glv gmh goh gon gor got grb grc gre grn gsw guj gwi hai hat hau haw heb her hil him hin hit hmn hmo hrv hsb hun hup iba ibo ice ido iii ijo iku ile ilo ina inc ind ine inh ipk ira iro ita jav jbo jpn jpr jrb kaa kab kac kal kam kan kar kas kau kaw kaz kbd kha khi khm kho kik kin kir kmb kok kom kon kor kos kpe krc krl kro kru kua kum kur kut lad lah lam lao lat lav lez lim lin lit lol loz ltz lua lub lug lui lun luo lus mac mad mag mah mai mak mal man mao map mar mas may mdf mdr men mga mic min mis mkh mlg mlt mnc mni mno moh mon mos mul mun mus mwl mwr myn myv nah nai nap nau nav nbl nde ndo nds nep new nia nic niu nno nob nog non nor nqo nso nub nwc nya nym nyn nyo nzi oci oji ori orm osa oss ota oto paa pag pal pam pan pap pau peo per phi phn pli pol pon por pra pro pus que raj rap rar roa roh rom rum run rup rus sad sag sah sai sal sam san sas sat scn sco sel sem sga sgn shn sid sin sio sit sla slo slv sma sme smi smj smn smo sms sna snd snk sog som son sot spa srd srn srp srr ssa ssw suk sun sus sux swa swe syc syr tah tai tam tat tel tem ter tet tgk tgl tha tib tig tir tiv tkl tlh tli tmh tog ton tpi tsi tsn tso tuk tum tup tur tut tvl twi tyv udm uga uig ukr umb und urd uzb vai ven vie vol vot wak wal war was wel wen wln wol xal xho yao yap yid yor ypk zap zbl zen zgh zha znd zul zun zxx zza'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer -l' -f -k -a 'abk ace ach ada ady afa afh afr ain aka akk alb ale alg alt amh ang anp apa ara arc arg arm arn arp art arw asm ast ath aus ava ave awa aym aze bad bai bak bal bam ban baq bas bat bej bel bem ben ber bho bih bik bin bis bla bnt bos bra bre btk bua bug bul bur byn cad cai car cat cau ceb cel cha chb che chg chi chk chm chn cho chp chr chu chv chy cmc cnr cop cor cos cpe cpf cpp cre crh crp csb cus cze dak dan dar day del den dgr din div doi dra dsb dua dum dut dyu dzo efi egy eka elx eng enm epo est ewe ewo fan fao fat fij fil fin fiu fon fre frm fro frr frs fry ful fur gaa gay gba gem geo ger gez gil gla gle glg glv gmh goh gon gor got grb grc gre grn gsw guj gwi hai hat hau haw heb her hil him hin hit hmn hmo hrv hsb hun hup iba ibo ice ido iii ijo iku ile ilo ina inc ind ine inh ipk ira iro ita jav jbo jpn jpr jrb kaa kab kac kal kam kan kar kas kau kaw kaz kbd kha khi khm kho kik kin kir kmb kok kom kon kor kos kpe krc krl kro kru kua kum kur kut lad lah lam lao lat lav lez lim lin lit lol loz ltz lua lub lug lui lun luo lus mac mad mag mah mai mak mal man mao map mar mas may mdf mdr men mga mic min mis mkh mlg mlt mnc mni mno moh mon mos mul mun mus mwl mwr myn myv nah nai nap nau nav nbl nde ndo nds nep new nia nic niu nno nob nog non nor nqo nso nub nwc nya nym nyn nyo nzi oci oji ori orm osa oss ota oto paa pag pal pam pan pap pau peo per phi phn pli pol pon por pra pro pus que raj rap rar roa roh rom rum run rup rus sad sag sah sai sal sam san sas sat scn sco sel sem sga sgn shn sid sin sio sit sla slo slv sma sme smi smj smn smo sms sna snd snk sog som son sot spa srd srn srp srr ssa ssw suk sun sus sux swa swe syc syr tah tai tam tat tel tem ter tet tgk tgl tha tib tig tir tiv tkl tlh tli tmh tog ton tpi tsi tsn tso tuk tum tup tur tut tvl twi tyv udm uga uig ukr umb und urd uzb vai ven vie vol vot wak wal war was wel wen wln wol xal xho yao yap yid yor ypk zap zbl zen zgh zha znd zul zun zxx zza'
complete -c movie-organizer -n '__fish_movie-organizer_using_command movie-organizer' -f -s h -l help -d 'Show help information.'
