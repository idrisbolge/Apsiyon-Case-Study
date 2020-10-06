using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Soru3
{
    public partial class Form1 : Form
    {
        bool optDurum = false;
        double sonuc = 0;
        string opt = "";

        public Form1()
        {
            InitializeComponent();

        }


        private void NumberEvent(object sender, EventArgs e)
        {
            if (txtSonuc.Text == "0" || optDurum)
                txtSonuc.Clear();

            optDurum = false;
            Button btn = (Button)sender;
            txtSonuc.Text += btn.Text;
        }
        private void Operations(object sender, EventArgs e)
        {
            try
            {
            optDurum = true;
            Button btn = (Button)sender;
            string yeniOpt = btn.Text;

            txtIslem.Text = txtIslem.Text + " " + txtSonuc.Text + " " + yeniOpt;

            switch (opt)
            {
                case "+": txtSonuc.Text = (sonuc + Double.Parse(txtSonuc.Text)).ToString(); break;
                case "-": txtSonuc.Text = (sonuc - Double.Parse(txtSonuc.Text)).ToString(); break;
                case "x": txtSonuc.Text = (sonuc * Double.Parse(txtSonuc.Text)).ToString(); break;
                case "/": txtSonuc.Text = (sonuc / Double.Parse(txtSonuc.Text)).ToString(); break;
                case "%": txtSonuc.Text = (sonuc % Double.Parse(txtSonuc.Text)).ToString(); break;

            }

            sonuc = Double.Parse(txtSonuc.Text);
            txtSonuc.Text = sonuc.ToString();
            opt = yeniOpt;
            }
            catch (FormatException ex)
            {
                txtSonuc.Text = "";
                txtIslem.Text = "";
                MessageBox.Show("Uyumsuz Format");
            }
            
        }

        private void button17_Click(object sender, EventArgs e)
        {
            txtSonuc.Text = "0";
        }

        private void button18_Click(object sender, EventArgs e)
        {
            txtSonuc.Text = "0";
            txtIslem.Text = "";
            opt = "";
            sonuc = 0;
            optDurum = false;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            txtIslem.Text = "";
            optDurum = true;
            switch (opt)
            {
                case "+": txtSonuc.Text = (sonuc + Double.Parse(txtSonuc.Text)).ToString(); break;
                case "-": txtSonuc.Text = (sonuc - Double.Parse(txtSonuc.Text)).ToString(); break;
                case "x": txtSonuc.Text = (sonuc * Double.Parse(txtSonuc.Text)).ToString(); break;
                case "/": txtSonuc.Text = (sonuc / Double.Parse(txtSonuc.Text)).ToString(); break;
                case "%": txtSonuc.Text = (sonuc % Double.Parse(txtSonuc.Text)).ToString(); break;


            }
            sonuc = Double.Parse(txtSonuc.Text);
            txtSonuc.Text = sonuc.ToString();
            opt = "";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (txtSonuc.Text == "0")
                txtSonuc.Text = "0";

            else if (optDurum)
                txtSonuc.Text = "0";

            if (!txtSonuc.Text.Contains(","))
                txtSonuc.Text += ",";

            optDurum = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            txtSonuc.Text = (Double.Parse(txtSonuc.Text) * -1).ToString();
        }




        private void button7_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

    }
}

