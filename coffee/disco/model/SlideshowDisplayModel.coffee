do ->
  class disco.SlideshowDisplayModel extends Backbone.Model
    defaults: ->
      index: 0
      transitionRate: 10000
      images: ["../images/slideshow/#COUPLESSTALKING2013.jpg",                                             
                "../images/slideshow/14699_4573874903194_1927148438_n.jpg",                                 
                "../images/slideshow/154462_4573875943220_1002027454_n.jpg",                                
                "../images/slideshow/155921_4573876903244_2045235837_n.jpg",                                
                "../images/slideshow/215410_10200259076097848_165979383_n.jpg",                             
                "../images/slideshow/316502_4573874863193_788303896_n.jpg",                                 
                "../images/slideshow/375393_4573878943295_1081606515_n.jpg",                                
                "../images/slideshow/382080_4573875983221_1702581572_n.jpg",                                
                "../images/slideshow/522678_4573877583261_1850088874_n.jpg",                                
                "../images/slideshow/526687_10200259072537759_2072685245_n.jpg",                            
                "../images/slideshow/546845_4573874823192_448240341_n.jpg",                                 
                "../images/slideshow/546961_4573879623312_2018985879_n.jpg",                                
                "../images/slideshow/548647_4573879463308_449371794_n.jpg",                                 
                "../images/slideshow/556941_10200259071017721_401311528_n.jpg",                             
                "../images/slideshow/559709_10200259070817716_507471357_n.jpg",                             
                "../images/slideshow/559944_10200259070897718_505598030_n.jpg",                             
                "../images/slideshow/563799_4573879303304_185659559_n.jpg",                                 
                "../images/slideshow/577150_10200259075497833_547575842_n.jpg",                             
                "../images/slideshow/600405_10200259073937794_209205637_n.jpg",                             
                "../images/slideshow/62466_10200259074697813_1218943384_n.jpg",                             
                "../images/slideshow/64192_10200259074337804_300538893_n.jpg",                              
                "../images/slideshow/64604_4573876863243_136747559_n.jpg",                                  
                "../images/slideshow/64645_4573878623287_1742741450_n.jpg",                                 
                "../images/slideshow/66721_4573878463283_404831749_n.jpg",                                  
                "../images/slideshow/69823_10200259073497783_1726370230_n.jpg",                             
                "../images/slideshow/alan and i were being really helpful..jpg",                            
                "../images/slideshow/alan doesn't like pictures..jpg",                                      
                "../images/slideshow/BUT DOHYUN IS SO CLOSE TO FINISHING WE MUST SUPPORT HIM..jpg",         
                "../images/slideshow/emma gets bored and attempts to be artsy..jpg",                        
                "../images/slideshow/give me tiger..jpg",                                                   
                "../images/slideshow/hai priya..jpg",                                                       
                "../images/slideshow/I AM ARTIST HEAR ME ROAR..jpg",                                        
                "../images/slideshow/ice cream cats 030a.jpg",                                              
                "../images/slideshow/ice cream cats 038.jpg",                                               
                "../images/slideshow/i'm gonna vote that this all still counts as summer.__HI NIKKI..jpg",  
                "../images/slideshow/IMG_0048.jpg",                                                         
                "../images/slideshow/IMG_0053.jpg",                                                         
                "../images/slideshow/IMG_0055.jpg",                                                         
                "../images/slideshow/IMG_0057.jpg",                                                         
                "../images/slideshow/IMG_0062.jpg",                                                         
                "../images/slideshow/IMG_0064.jpg",                                                         
                "../images/slideshow/IMG_0104.jpg",                                                         
                "../images/slideshow/IMG_0105.jpg",                                                         
                "../images/slideshow/IMG_0106.jpg",                                                         
                "../images/slideshow/IMG_0107.jpg",                                                         
                "../images/slideshow/IMG_0108.jpg",                                                         
                "../images/slideshow/IMG_0109.jpg",                                                         
                "../images/slideshow/IMG_0110.jpg",                                                         
                "../images/slideshow/IMG_0111.jpg",                                                         
                "../images/slideshow/IMG_0112.jpg",                                                         
                "../images/slideshow/IMG_0113.jpg",                                                         
                "../images/slideshow/IMG_0114.jpg",                                                         
                "../images/slideshow/IMG_0115.jpg",                                                         
                "../images/slideshow/IMG_0116.jpg",                                                         
                "../images/slideshow/IMG_0117.jpg",                                                         
                "../images/slideshow/IMG_0118.jpg",                                                         
                "../images/slideshow/IMG_0119.jpg",                                                         
                "../images/slideshow/IMG_0120.jpg",                                                         
                "../images/slideshow/IMG_0121.jpg",                                                         
                "../images/slideshow/IMG_0122.jpg",                                                         
                "../images/slideshow/IMG_0123.jpg",                                                         
                "../images/slideshow/IMG_0125.jpg",                                                         
                "../images/slideshow/IMG_0126.jpg",                                                         
                "../images/slideshow/IMG_0127.jpg",                                                         
                "../images/slideshow/IMG_0128.jpg",                                                         
                "../images/slideshow/IMG_0129.jpg",                                                         
                "../images/slideshow/IMG_0130.jpg",                                                         
                "../images/slideshow/IMG_0133.jpg",                                                         
                "../images/slideshow/IMG_0136.jpg",                                                         
                "../images/slideshow/IMG_0137.jpg",                                                         
                "../images/slideshow/IMG_0138.jpg",                                                         
                "../images/slideshow/IMG_0139.jpg",                                                         
                "../images/slideshow/IMG_0141.jpg",                                                         
                "../images/slideshow/IMG_0149.jpg",                                                         
                "../images/slideshow/IMG_0150.jpg",                                                         
                "../images/slideshow/IMG_0153.jpg",                                                         
                "../images/slideshow/IMG_0161.jpg",                                                         
                "../images/slideshow/IMG_0164.jpg",                                                         
                "../images/slideshow/IMG_0172.jpg",                                                         
                "../images/slideshow/IMG_0174.jpg",                                                         
                "../images/slideshow/IMG_0185.jpg",                                                         
                "../images/slideshow/IMG_0208.jpg",                                                         
                "../images/slideshow/IMG_0210.jpg",                                                         
                "../images/slideshow/IMG_0241.jpg",                                                         
                "../images/slideshow/IMG_0295.jpg",                                                         
                "../images/slideshow/IMG_0296.jpg",                                                         
                "../images/slideshow/IMG_0331.jpg",                                                         
                "../images/slideshow/IMG_0357.jpg",                                                         
                "../images/slideshow/IMG_0375.jpg",                                                         
                "../images/slideshow/IMG_0408.jpg",                                                         
                "../images/slideshow/IMG_0410.jpg",                                                         
                "../images/slideshow/IMG_0484.jpg",                                                         
                "../images/slideshow/IMG_0486.jpg",                                                         
                "../images/slideshow/IMG_0487.jpg",                                                         
                "../images/slideshow/IMG_0491.jpg",                                                         
                "../images/slideshow/IMG_0492.jpg",                                                         
                "../images/slideshow/IMG_0493.jpg",                                                         
                "../images/slideshow/IMG_0495.jpg",                                                         
                "../images/slideshow/IMG_0496.jpg",                                                         
                "../images/slideshow/IMG_0498.jpg",                                                         
                "../images/slideshow/IMG_0499.jpg",                                                         
                "../images/slideshow/IMG_0500.jpg",                                                         
                "../images/slideshow/IMG_0501.jpg",                                                         
                "../images/slideshow/IMG_0502.jpg",                                                         
                "../images/slideshow/IMG_0503.jpg",                                                         
                "../images/slideshow/IMG_0506.jpg",                                                         
                "../images/slideshow/IMG_0509.jpg",                                                         
                "../images/slideshow/IMG_0510.jpg",                                                         
                "../images/slideshow/IMG_0511.jpg",                                                         
                "../images/slideshow/IMG_0512.jpg",                                                         
                "../images/slideshow/IMG_0516.jpg",                                                         
                "../images/slideshow/IMG_0527.jpg",                                                         
                "../images/slideshow/IMG_0540.jpg",                                                         
                "../images/slideshow/IMG_0550.jpg",                                                         
                "../images/slideshow/IMG_0658.jpg",                                                         
                "../images/slideshow/IMG_0662.jpg",                                                         
                "../images/slideshow/IMG_0797.jpg",                                                         
                "../images/slideshow/IMG_0800.jpg",                                                         
                "../images/slideshow/IMG_0801.jpg",                                                         
                "../images/slideshow/IMG_0802.jpg",                                                         
                "../images/slideshow/IMG_0803.jpg",                                                         
                "../images/slideshow/IMG_0804.jpg",                                                         
                "../images/slideshow/IMG_0805.jpg",                                                         
                "../images/slideshow/IMG_0806.jpg",                                                         
                "../images/slideshow/IMG_0807.jpg",                                                         
                "../images/slideshow/IMG_0810.jpg",                                                         
                "../images/slideshow/IMG_0811.jpg",                                                         
                "../images/slideshow/IMG_0812.jpg",                                                         
                "../images/slideshow/IMG_0813.jpg",                                                         
                "../images/slideshow/IMG_0814.jpg",                                                         
                "../images/slideshow/IMG_0816.jpg",                                                         
                "../images/slideshow/IMG_0820.jpg",                                                         
                "../images/slideshow/IMG_0823.jpg",                                                         
                "../images/slideshow/IMG_0830.jpg",                                                         
                "../images/slideshow/IMG_0836.jpg",                                                         
                "../images/slideshow/IMG_0837.jpg",                                                         
                "../images/slideshow/IMG_0838.jpg",                                                         
                "../images/slideshow/IMG_0839.jpg",                                                         
                "../images/slideshow/IMG_0849.jpg",                                                         
                "../images/slideshow/IMG_0860.jpg",                                                         
                "../images/slideshow/IMG_0862.jpg",                                                         
                "../images/slideshow/IMG_0863.jpg",                                                         
                "../images/slideshow/IMG_0877.jpg",                                                         
                "../images/slideshow/IMG_0878.jpg",                                                         
                "../images/slideshow/IMG_0879.jpg",                                                         
                "../images/slideshow/IMG_0889.jpg",                                                         
                "../images/slideshow/IMG_0905.jpg",                                                         
                "../images/slideshow/IMG_0906.jpg",                                                         
                "../images/slideshow/IMG_0907 (1).jpg",                                                     
                "../images/slideshow/IMG_0907.jpg",                                                         
                "../images/slideshow/IMG_0908.jpg",                                                         
                "../images/slideshow/IMG_0909.jpg",                                                         
                "../images/slideshow/IMG_0910.jpg",                                                         
                "../images/slideshow/IMG_0911.jpg",                                                         
                "../images/slideshow/IMG_0912.jpg",                                                         
                "../images/slideshow/IMG_0913.jpg",                                                         
                "../images/slideshow/IMG_0914.jpg",                                                         
                "../images/slideshow/IMG_0915.jpg",                                                         
                "../images/slideshow/IMG_0916.jpg",                                                         
                "../images/slideshow/IMG_0917.jpg",                                                         
                "../images/slideshow/IMG_0918.jpg",                                                         
                "../images/slideshow/IMG_0922.jpg",                                                         
                "../images/slideshow/IMG_0923.jpg",                                                         
                "../images/slideshow/IMG_0925.jpg",                                                         
                "../images/slideshow/IMG_0930.jpg",                                                         
                "../images/slideshow/IMG_0932.jpg",                                                         
                "../images/slideshow/IMG_0933.jpg",                                                         
                "../images/slideshow/IMG_0935.jpg",                                                         
                "../images/slideshow/IMG_0936.jpg",                                                         
                "../images/slideshow/IMG_0939.jpg",                                                         
                "../images/slideshow/IMG_0940.jpg",                                                         
                "../images/slideshow/IMG_0952.jpg",                                                         
                "../images/slideshow/IMG_0954.jpg",                                                         
                "../images/slideshow/IMG_0955.jpg",                                                         
                "../images/slideshow/IMG_0956.jpg",                                                         
                "../images/slideshow/IMG_0957.jpg",                                                         
                "../images/slideshow/IMG_0958.jpg",                                                         
                "../images/slideshow/IMG_0959.jpg",                                                         
                "../images/slideshow/IMG_0960.jpg",                                                         
                "../images/slideshow/IMG_0961.jpg",                                                         
                "../images/slideshow/IMG_0962.jpg",                                                         
                "../images/slideshow/IMG_0968.jpg",                                                         
                "../images/slideshow/IMG_0969.jpg",                                                         
                "../images/slideshow/IMG_0970.jpg",                                                         
                "../images/slideshow/IMG_0971.jpg",                                                         
                "../images/slideshow/IMG_0972.jpg",                                                         
                "../images/slideshow/IMG_0973.jpg",                                                         
                "../images/slideshow/IMG_0974.jpg",                                                         
                "../images/slideshow/IMG_0975.jpg",                                                         
                "../images/slideshow/IMG_0976.jpg",                                                         
                "../images/slideshow/IMG_0977.jpg",                                                         
                "../images/slideshow/IMG_0978.jpg",                                                         
                "../images/slideshow/IMG_0979.jpg",                                                         
                "../images/slideshow/IMG_0980.jpg",                                                         
                "../images/slideshow/IMG_0981.jpg",                                                         
                "../images/slideshow/IMG_0982.jpg",                                                         
                "../images/slideshow/IMG_0983.jpg",                                                         
                "../images/slideshow/IMG_0985.jpg",                                                         
                "../images/slideshow/IMG_0986.jpg",                                                         
                "../images/slideshow/IMG_0987.jpg",                                                         
                "../images/slideshow/IMG_0989.jpg",                                                         
                "../images/slideshow/IMG_0992.jpg",                                                         
                "../images/slideshow/IMG_0994.jpg",                                                         
                "../images/slideshow/IMG_0995.jpg",                                                         
                "../images/slideshow/IMG_0996.jpg",                                                         
                "../images/slideshow/IMG_0997.jpg",                                                         
                "../images/slideshow/IMG_0998.jpg",                                                         
                "../images/slideshow/IMG_0999.jpg",                                                         
                "../images/slideshow/IMG_1000.jpg",                                                         
                "../images/slideshow/IMG_1001.jpg",                                                         
                "../images/slideshow/IMG_1002.jpg",                                                         
                "../images/slideshow/IMG_1003.jpg",                                                         
                "../images/slideshow/IMG_1004.jpg",
                "../images/slideshow/IMG_1005.jpg",
                "../images/slideshow/IMG_1006.jpg",
                "../images/slideshow/IMG_1007.jpg",
                "../images/slideshow/IMG_1008.jpg",
                "../images/slideshow/IMG_1010.jpg",
                "../images/slideshow/IMG_1011.jpg",
                "../images/slideshow/IMG_1012.jpg",
                "../images/slideshow/IMG_1013.jpg",
                "../images/slideshow/IMG_1014.jpg",
                "../images/slideshow/IMG_1015.jpg",
                "../images/slideshow/IMG_1016.jpg",
                "../images/slideshow/IMG_1018.jpg",
                "../images/slideshow/IMG_1019.jpg",
                "../images/slideshow/IMG_1022.jpg",
                "../images/slideshow/IMG_1025.jpg",
                "../images/slideshow/IMG_1026.jpg",
                "../images/slideshow/IMG_1030.jpg",
                "../images/slideshow/IMG_1031.jpg",
                "../images/slideshow/IMG_1032.jpg",
                "../images/slideshow/IMG_1033.jpg",
                "../images/slideshow/IMG_1034.jpg",
                "../images/slideshow/IMG_1035.jpg",
                "../images/slideshow/IMG_1036.jpg",
                "../images/slideshow/IMG_1038.jpg",
                "../images/slideshow/IMG_1039.jpg",
                "../images/slideshow/IMG_1040.jpg",
                "../images/slideshow/IMG_1041.jpg",
                "../images/slideshow/IMG_1042.jpg",
                "../images/slideshow/IMG_1046.jpg",
                "../images/slideshow/IMG_1047.jpg",
                "../images/slideshow/IMG_1049.jpg",
                "../images/slideshow/IMG_1050.jpg",
                "../images/slideshow/IMG_1051.jpg",
                "../images/slideshow/IMG_1052.jpg",
                "../images/slideshow/IMG_1053.jpg",
                "../images/slideshow/IMG_1054.jpg",
                "../images/slideshow/IMG_1055.jpg",
                "../images/slideshow/IMG_1056.jpg",
                "../images/slideshow/IMG_1057.jpg",
                "../images/slideshow/IMG_1058.jpg",
                "../images/slideshow/IMG_1059.jpg",
                "../images/slideshow/IMG_1060.jpg",
                "../images/slideshow/IMG_1061.jpg",
                "../images/slideshow/IMG_1062.jpg",
                "../images/slideshow/IMG_1063.jpg",
                "../images/slideshow/IMG_1064.jpg",
                "../images/slideshow/IMG_1065.jpg",
                "../images/slideshow/IMG_1066.jpg",
                "../images/slideshow/IMG_1067.jpg",
                "../images/slideshow/IMG_1072.jpg",
                "../images/slideshow/IMG_1073.jpg",
                "../images/slideshow/IMG_1078.jpg",
                "../images/slideshow/IMG_1082.jpg",
                "../images/slideshow/IMG_1083.jpg",
                "../images/slideshow/IMG_1084.jpg",
                "../images/slideshow/IMG_1099.jpg",
                "../images/slideshow/IMG_1100.jpg",
                "../images/slideshow/IMG_1101.jpg",
                "../images/slideshow/IMG_1102.jpg",
                "../images/slideshow/IMG_1103.jpg",
                "../images/slideshow/IMG_1104.jpg",
                "../images/slideshow/IMG_1105.jpg",
                "../images/slideshow/IMG_1106.jpg",
                "../images/slideshow/IMG_1107.jpg",
                "../images/slideshow/IMG_1108.jpg",
                "../images/slideshow/IMG_1109.jpg",
                "../images/slideshow/IMG_1110.jpg",
                "../images/slideshow/IMG_1111.jpg",
                "../images/slideshow/IMG_1112.jpg",
                "../images/slideshow/IMG_1116.jpg",
                "../images/slideshow/IMG_1117.jpg",
                "../images/slideshow/IMG_1119.jpg",
                "../images/slideshow/IMG_1120.jpg",
                "../images/slideshow/IMG_1123.jpg",
                "../images/slideshow/IMG_1124.jpg",
                "../images/slideshow/IMG_1125.jpg",
                "../images/slideshow/IMG_1126.jpg",
                "../images/slideshow/IMG_1127.jpg",
                "../images/slideshow/IMG_1129.jpg",
                "../images/slideshow/IMG_1249.jpg",
                "../images/slideshow/IMG_1264.jpg",
                "../images/slideshow/IMG_1266.jpg",
                "../images/slideshow/IMG_1267.jpg",
                "../images/slideshow/IMG_1371.jpg",
                "../images/slideshow/IMG_1372.jpg",
                "../images/slideshow/IMG_1373.jpg",
                "../images/slideshow/IMG_1374.jpg",
                "../images/slideshow/IMG_1375.jpg",
                "../images/slideshow/IMG_1377.jpg",
                "../images/slideshow/IMG_1378.jpg",
                "../images/slideshow/IMG_1379.jpg",
                "../images/slideshow/IMG_1412.jpg",
                "../images/slideshow/IMG_1413.jpg",
                "../images/slideshow/IMG_1422.jpg",
                "../images/slideshow/IMG_1424.jpg",
                "../images/slideshow/IMG_1426.jpg",
                "../images/slideshow/IMG_1427.jpg",
                "../images/slideshow/IMG_1428.jpg",
                "../images/slideshow/IMG_1430.jpg",
                "../images/slideshow/IMG_1431.jpg",
                "../images/slideshow/IMG_1432.jpg",
                "../images/slideshow/IMG_1433.jpg",
                "../images/slideshow/IMG_1436.jpg",
                "../images/slideshow/IMG_1449.jpg",
                "../images/slideshow/IMG_1455.jpg",
                "../images/slideshow/IMG_1461.jpg",
                "../images/slideshow/IMG_1474.jpg",
                "../images/slideshow/IMG_1482.jpg",
                "../images/slideshow/IMG_1483.jpg",
                "../images/slideshow/IMG_1484.jpg",
                "../images/slideshow/IMG_1485.jpg",
                "../images/slideshow/IMG_1498.jpg",
                "../images/slideshow/IMG_1522.jpg",
                "../images/slideshow/IMG_1543.jpg",
                "../images/slideshow/IMG_1720.jpg",
                "../images/slideshow/IMG_1725.jpg",
                "../images/slideshow/IMG_1733.jpg",
                "../images/slideshow/IMG_1744.jpg",
                "../images/slideshow/IMG_1748.jpg",
                "../images/slideshow/IMG_1754.jpg",
                "../images/slideshow/IMG_1755.jpg",
                "../images/slideshow/IMG_1756.jpg",
                "../images/slideshow/IMG_1757.jpg",
                "../images/slideshow/IMG_1763.jpg",
                "../images/slideshow/IMG_1764.jpg",
                "../images/slideshow/IMG_1765.jpg",
                "../images/slideshow/IMG_1766.jpg",
                "../images/slideshow/IMG_1768.jpg",
                "../images/slideshow/IMG_1769.jpg",
                "../images/slideshow/IMG_1771.jpg",
                "../images/slideshow/IMG_1773.jpg",
                "../images/slideshow/IMG_1774.jpg",
                "../images/slideshow/IMG_1775.jpg",
                "../images/slideshow/IMG_1776.jpg",
                "../images/slideshow/IMG_1777.jpg",
                "../images/slideshow/IMG_1784.jpg",
                "../images/slideshow/IMG_1830.jpg",
                "../images/slideshow/IMG_1833.jpg",
                "../images/slideshow/IMG_1835.jpg",
                "../images/slideshow/IMG_1841.jpg",
                "../images/slideshow/IMG_1864.jpg",
                "../images/slideshow/IMG_1865.jpg",
                "../images/slideshow/IMG_1867.jpg",
                "../images/slideshow/IMG_1868.jpg",
                "../images/slideshow/IMG_1869.jpg",
                "../images/slideshow/IMG_1870.jpg",
                "../images/slideshow/IMG_1871.jpg",
                "../images/slideshow/IMG_1872.jpg",
                "../images/slideshow/IMG_1873.jpg",
                "../images/slideshow/IMG_1874.jpg",
                "../images/slideshow/IMG_1891.jpg",
                "../images/slideshow/IMG_1903.jpg",
                "../images/slideshow/IMG_1910.jpg",
                "../images/slideshow/IMG_1911.jpg",
                "../images/slideshow/IMG_1914.jpg",
                "../images/slideshow/LOOK WE HANG OUT AND DO THINGS..jpg",
                "../images/slideshow/magnum.jpg",
                "../images/slideshow/mit february march 023.jpg",
                "../images/slideshow/mit february march 027.jpg",
                "../images/slideshow/mit november 2011 052.jpg",
                "../images/slideshow/mit november 2011 056.jpg",
                "../images/slideshow/mit november 2011 057.jpg",
                "../images/slideshow/mit november 2011 058.jpg",
                "../images/slideshow/mit november 2011 059.jpg",
                "../images/slideshow/mit november 2011 061.jpg",
                "../images/slideshow/mit november 2011 062.jpg",
                "../images/slideshow/mit november 2011 063.jpg",
                "../images/slideshow/mitfroshendofyear 160.jpg",
                "../images/slideshow/mitfroshendofyear 163.jpg",
                "../images/slideshow/mitfroshendofyear 165.jpg",
                "../images/slideshow/mitfroshendofyear 166.jpg",
                "../images/slideshow/mitfroshendofyear 167.jpg",
                "../images/slideshow/mitfroshendofyear 168.jpg",
                "../images/slideshow/mitfroshendofyear 169.jpg",
                "../images/slideshow/mitfroshendofyear 170.jpg",
                "../images/slideshow/mitfroshendofyear 173.jpg",
                "../images/slideshow/mitfroshendofyear 177.jpg",
                "../images/slideshow/mitfroshendofyear 178.jpg",
                "../images/slideshow/mitfroshendofyear 180.jpg",
                "../images/slideshow/mitfroshendofyear 190.jpg",
                "../images/slideshow/mitfroshendofyear 191.jpg",
                "../images/slideshow/mitfroshendofyear 192.jpg",
                "../images/slideshow/mitfroshendofyear 193.jpg",
                "../images/slideshow/mitfroshendofyear 195.jpg",
                "../images/slideshow/mitfroshendofyear 199.jpg",
                "../images/slideshow/mitfroshendofyear 203.jpg",
                "../images/slideshow/mitfroshendofyear 204.jpg",
                "../images/slideshow/mitfroshendofyear 205.jpg",
                "../images/slideshow/mitfroshendofyear 206.jpg",
                "../images/slideshow/mitfroshendofyear 207.jpg",
                "../images/slideshow/mitfroshendofyear 210.jpg",
                "../images/slideshow/mitfroshendofyear 212.jpg",
                "../images/slideshow/mitfroshendofyear 213.jpg",
                "../images/slideshow/mitmarch 031a.jpg",
                "../images/slideshow/mitmarch 037.jpg",
                "../images/slideshow/mitmarch 038.jpg",
                "../images/slideshow/mitmarch 039.jpg",
                "../images/slideshow/more mural painting..jpg",
                "../images/slideshow/nearing completion..jpg",
                "../images/slideshow/no, i'm not going to stop taking photos..jpg",
                "../images/slideshow/oh hey....jpg",
                "../images/slideshow/shtuff 051.jpg",
                "../images/slideshow/SIGNING YAY.jpg",
                "../images/slideshow/SIMBAAAAAA.jpg",
                "../images/slideshow/smiley dohyun..jpg",
                "../images/slideshow/so proud..jpg",
                "../images/slideshow/steven shows us how to twerk..jpg",
                "../images/slideshow/the artist at work..jpg",
                "../images/slideshow/things sort of went downhill from here..jpg",
                "../images/slideshow/things start getting weird around 3 am..jpg",
                "../images/slideshow/yay mural..jpg"]