import tkinter as tk
from src.gui import SupermarketApp

def main():
    root = tk.Tk()
    app = SupermarketApp(root)
    root.mainloop()

if __name__ == "__main__":
    main() 