# D4L

Example code implemented with VIPER architecture due to high testability. Also, VIPER provides better separation of concerns. This means simpler code and simpler bugs to solve. Although most developers don't prefer VIPER for this type of small projects due to boiler plate code, I used a VIPER template so that those codes are automatically created.
Each class is easily extendable for new features. Boundaries are protedted with protocols so that we can easily change implementations.

Due to time constraints I dont't have 100% test coverage. Tests are defeinitely can be improved. Also, some of UI can be tested througout our unit tests as well(Something like whether reload the table or not).

Another improvement would be to use new NSDiffableDataSource approach to not reload tables all the time.

I did not spend much time on UI so it can be improved as well.
