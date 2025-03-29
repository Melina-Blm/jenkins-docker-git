import unittest
from new import add  # Importation de la fonction 'add' depuis new.py

class TestAddFunction(unittest.TestCase):
    def test_add(self):
        self.assertEqual(add(2, 3), 5)  # Test si 2 + 3 = 5

if __name__ == '__main__':
    unittest.main()
