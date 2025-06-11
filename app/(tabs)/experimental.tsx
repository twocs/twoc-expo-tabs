import { StyleSheet, TouchableOpacity } from 'react-native';

import EditScreenInfo from '@/components/EditScreenInfo';
import { Text, View } from '@/components/Themed';
import Colors from '@/constants/Colors';
import { useTheme } from '@/context/ThemeContext';

export default function ExperimentalScreen() {
  const { isDarkMode, toggleTheme } = useTheme();

  const currentTheme = isDarkMode ? 'dark' : 'light';
  const tintColor = Colors[currentTheme].tint;

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Experimental</Text>

      <TouchableOpacity
        style={[styles.toggleButton, { borderColor: tintColor }]}
        onPress={toggleTheme}>
        <Text style={styles.toggleText}>Mode: {isDarkMode ? 'Dark' : 'Light'}</Text>
      </TouchableOpacity>

      <View style={styles.separator} lightColor="#eee" darkColor="rgba(255,255,255,0.1)" />
      <EditScreenInfo path="app/(tabs)/experimental.tsx" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
  },
  toggleButton: {
    marginTop: 20,
    paddingHorizontal: 20,
    paddingVertical: 10,
    borderWidth: 2,
    borderRadius: 8,
  },
  toggleText: {
    fontSize: 16,
    fontWeight: '600',
  },
  separator: {
    marginVertical: 30,
    height: 1,
    width: '80%',
  },
});
