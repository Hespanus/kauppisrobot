import unittest
import thumbnail


class TestThumbnail(unittest.TestCase):

    def test_edit_img_name(self):      
        self.assertEqual(thumbnail.edit_img_name("joku.jpg"), "joku_x250.jpg")
        self.assertEqual(thumbnail.edit_img_name("joku.toinen.jpg"), "joku.toinen_x250.jpg")
        self.assertEqual(thumbnail.edit_img_name("joku.toinen.kolmas.jpg"), "joku.toinen.kolmas_x250.jpg")

if __name__ == '__main__':
    unittest.main()