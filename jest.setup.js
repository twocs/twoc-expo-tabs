// Mock AsyncStorage for Jest tests
jest.mock("@react-native-async-storage/async-storage", () =>
  require("@react-native-async-storage/async-storage/jest/async-storage-mock")
);

// Mock other React Native modules that might be needed
jest.mock("react-native/Libraries/EventEmitter/NativeEventEmitter");

// Mock the ThemeContext to provide stable values for testing
jest.mock("@/context/ThemeContext", () => ({
  useTheme: () => ({
    isDarkMode: false,
    toggleTheme: jest.fn(),
    isLoading: false,
  }),
  ThemeProvider: ({ children }) => children,
}));
