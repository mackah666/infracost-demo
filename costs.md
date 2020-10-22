
  NAME                                       MONTHLY QTY  UNIT        PRICE   HOURLY COST  MONTHLY COST  

  aws_db_instance.default                                                                                
  [90m├─ Database instance[0m                               [90m730[0m  [90mhours[0m       [90m0.0180[0m       [90m0.0180[0m       [90m13.1400[0m  
  [90m└─ Database storage[0m                                 [90m20[0m  [90mGB-months[0m   [90m0.1270[0m       [90m0.0035[0m        [90m2.5400[0m  
  Total                                                                            0.0215       15.6800  
                                                                                                         
  aws_dynamodb_table.someTable666                                                                        
  [90m├─ Continuous backup storage (PITR)[0m                  [90m0[0m  [90mGB-months[0m   [90m0.2200[0m       [90m0.0000[0m        [90m0.0000[0m  
  [90m├─ Data storage[0m                                      [90m0[0m  [90mGB-months[0m   [90m0.2830[0m       [90m0.0000[0m        [90m0.0000[0m  
  [90m├─ On-demand backup storage[0m                          [90m0[0m  [90mGB-months[0m   [90m0.1100[0m       [90m0.0000[0m        [90m0.0000[0m  
  [90m├─ Read capacity unit (RCU)[0m                       [90m3650[0m  [90mRCU-hours[0m   [90m0.0001[0m       [90m0.0007[0m        [90m0.5365[0m  
  [90m├─ Restore data size[0m                                 [90m0[0m  [90mGB[0m          [90m0.1700[0m       [90m0.0000[0m        [90m0.0000[0m  
  [90m├─ Streams read request unit (sRRU)[0m                  [90m0[0m  [90msRRUs[0m        [90m2e-07[0m       [90m0.0000[0m        [90m0.0000[0m  
  [90m└─ Write capacity unit (WCU)[0m                      [90m3650[0m  [90mWCU-hours[0m   [90m0.0007[0m       [90m0.0037[0m        [90m2.6827[0m  
  Total                                                                            0.0044        3.2193  
                                                                                                         
  aws_instance.web                                                                                       
  [90m├─ CPU credits[0m                                       [90m0[0m  [90mvCPU-hours[0m  [90m0.0000[0m       [90m0.0000[0m        [90m0.0000[0m  
  [90m├─ Linux/UNIX usage (on-demand, t3.micro)[0m          [90m730[0m  [90mhours[0m       [90m0.0114[0m       [90m0.0114[0m        [90m8.3220[0m  
  [90m└─ root_block_device[0m                       
  [90m   └─ General Purpose SSD storage (gp2)[0m              [90m8[0m  [90mGB-months[0m   [90m0.1100[0m       [90m0.0012[0m        [90m0.8800[0m  
  Total                                                                            0.0126        9.2020  
                                                                                                         
  aws_lambda_function.lambda_zip_inline                                                                  
  [90m├─ Duration[0m                                  [90m117500000[0m  [90mGB-seconds[0m   [90m2e-05[0m       [90m2.6827[0m     [90m1958.3373[0m  
  [90m└─ Requests[0m                                  [90m100000000[0m  [90mrequests[0m     [90m2e-07[0m       [90m0.0274[0m       [90m20.0000[0m  
  Total                                                                            2.7101     1978.3373  
                                                                                                         
  OVERALL TOTAL                                                                    2.7485     2006.4386  

7 out of 11 resources couldn't be estimated as Infracost doesn't support them yet (https://www.infracost.io/docs/supported_resources), re-run with --show-skipped to see the list.
We're continually adding new resources, please email hello@infracost.io if you'd like us to prioritize your list.
