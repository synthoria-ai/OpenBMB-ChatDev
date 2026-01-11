'''
This file initializes the calculator application.
'''
import tkinter as tk
from calculator import Calculator
class CalculatorApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Simple Calculator")
        self.calculator = Calculator()
        self.operator = None  # Initialize the operator attribute
        self.create_gui()
    def create_gui(self):
        # Entry widget to display and input numbers
        self.display = tk.Entry(self.root, width=20, borderwidth=5)
        self.display.grid(row=0, column=0, columnspan=4, padx=10, pady=10)
        # Buttons for numbers 0-9
        for i in range(1, 10):
            button = tk.Button(self.root, text=str(i), padx=20, pady=10, command=lambda i=i: self.append_to_display(i))
            button.grid(row=(i-1)//3 + 1, column=(i-1)%3, padx=5, pady=5)
        # Button for number 0
        button_zero = tk.Button(self.root, text='0', padx=20, pady=10, command=lambda: self.append_to_display(0))
        button_zero.grid(row=4, column=0, padx=5, pady=5)
        # Buttons for arithmetic operations
        buttons = ['+', '-', '*', '/']
        for i, operator in enumerate(buttons):
            button = tk.Button(self.root, text=operator, padx=20, pady=10, command=lambda operator=operator: self.set_operator(operator))
            button.grid(row=i+1, column=3, padx=5, pady=5)
        # Button for equals
        button_equals = tk.Button(self.root, text='=', padx=20, pady=10, command=self.calculate)
        button_equals.grid(row=4, column=1, columnspan=2, padx=5, pady=5)
        # Button for clear
        button_clear = tk.Button(self.root, text='C', padx=20, pady=10, command=self.clear_display)
        button_clear.grid(row=0, column=3, padx=5, pady=5)
    def append_to_display(self, value):
        current = self.display.get()
        self.display.delete(0, tk.END)
        self.display.insert(0, str(current) + str(value))
    def set_operator(self, operator):
        self.operator = operator
        self.first_number = float(self.display.get())
        self.display.delete(0, tk.END)
    def calculate(self):
        second_number = float(self.display.get())
        if self.operator == '+':
            result = self.calculator.add(self.first_number, second_number)
        elif self.operator == '-':
            result = self.calculator.subtract(self.first_number, second_number)
        elif self.operator == '*':
            result = self.calculator.multiply(self.first_number, second_number)
        elif self.operator == '/':
            result = self.calculator.divide(self.first_number, second_number)
        self.display.delete(0, tk.END)
        self.display.insert(0, str(result))
    def clear_display(self):
        self.display.delete(0, tk.END)
if __name__ == "__main__":
    root = tk.Tk()
    app = CalculatorApp(root)
    root.mainloop()