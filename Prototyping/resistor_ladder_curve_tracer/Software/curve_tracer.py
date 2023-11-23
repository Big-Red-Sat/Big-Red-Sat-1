import sys
import threading
import tkinter
from tkinter import messagebox
import os

import matplotlib.pyplot as plt
import serial
from matplotlib import animation
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure
from serial import SerialException
from serial.tools import list_ports
import pandas as pd

SMALL_SIZE = 8
MEDIUM_SIZE = 10
BIGGER_SIZE = 12

plt.rc('font', size=SMALL_SIZE)  # controls default text sizes
plt.rc('axes', titlesize=SMALL_SIZE)  # fontsize of the axes title
plt.rc('axes', labelsize=SMALL_SIZE)  # fontsize of the x and y labels
plt.rc('xtick', labelsize=SMALL_SIZE)  # fontsize of the tick labels
plt.rc('ytick', labelsize=SMALL_SIZE)  # fontsize of the tick labels
plt.rc('legend', fontsize=SMALL_SIZE)  # legend fontsize
plt.rc('figure', titlesize=BIGGER_SIZE)  # fontsize of the figure title
fig_color = '#%02x%02x%02x' % (240, 240, 237)

curve_points_i = []
curve_points_v = []
curve_point = []


def plot_curve(arg):
    plot1.clear()
    plot1.set_title("Photovoltaic I-V Curve")
    plot1.set_xlabel("Voltage (V)")
    plot1.set_ylabel("Current (mA)")
    plot1.plot(curve_points_v, curve_points_i)


def adc_to_voltage(adc_code, voltage=3.3):
    return (voltage * adc_code) / 4096.0


def adc_to_current(adc_code):
    v = adc_to_voltage(adc_code, voltage=1.2)
    return ((v / 50.0) / 0.51) * 1000.0


def read_curve():
    curve_point.clear()
    curve_points_v.clear()
    curve_points_i.clear()
    msp430_port.write(b'A')
    while len(curve_point) != 256:
        reading = ''.join(map(chr, msp430_port.readline().strip())).split(' ')
        curve_point.append(int(reading[0]))
        curve_points_v.append(adc_to_voltage(int(reading[1])))
        curve_points_i.append(adc_to_current(int(reading[2])))
    sc_cond.config(text=f"Short Circuit: {curve_points_v[-1]:.4f} V | {curve_points_i[-1]:.4f} mA")
    oc_cond.config(text=f"Open Circuit: {curve_points_v[0]:.4f} V | {curve_points_i[0]:.4f} mA")
    curve_output_path = os.path.join(output_path, 'curve_' + str(len(os.listdir(output_path))) + '.csv')
    curve_df = pd.DataFrame([curve_points_v, curve_points_i], index=['Voltage', 'Current']).transpose()
    curve_df.to_csv(curve_output_path)


def get_curve():
    thread = threading.Thread(target=read_curve)
    thread.daemon = True
    thread.start()


output_path = os.path.join(os.getcwd(), 'curves')
if not os.path.exists(output_path):
    os.mkdir(output_path)

msp430_port = None
ports = list_ports.comports()
try:
    for port in ports:
        if "MSP Application UART1" in port.description:
            msp430_port = serial.Serial(port.device, baudrate=115200)
    if not msp430_port:
        messagebox.showerror("No MSP430 Found", "Make sure development board is plugged in!")
        sys.exit(1)
except SerialException as se:
    messagebox.showerror("Serial Exception", "Could not connect to serial port!")

root = tkinter.Tk()
root.title("UNL Aerospace Club | Aerospace eXperimental Payloads 2022")
root.configure(bg='white')
button = tkinter.Button(root, text="Trace Curve", command=get_curve)
button.pack()
sc_cond = tkinter.Label(root, text="Short Circuit: --.-- V | --.-- mA", bg='white')
sc_cond.pack()
oc_cond = tkinter.Label(root, text="Open Circuit: --.-- V | --.-- mA", bg='white')
oc_cond.pack()
fig = Figure(figsize=(5, 5), dpi=100)
plot1 = fig.add_subplot(111)
plot1.set_title("Photovoltaic I-V Curve")
plot1.set_xlabel("Voltage (V)")
plot1.set_ylabel("Current (mA)")
canvas = FigureCanvasTkAgg(fig, master=root)
canvas.draw()
ani2 = animation.FuncAnimation(fig, plot_curve, fargs=([]), interval=100)

canvas.get_tk_widget().pack()
root.mainloop()
