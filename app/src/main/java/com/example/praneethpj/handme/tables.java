package com.example.praneethpj.handme;
import android.app.ProgressDialog;
import android.content.Intent;
import android.graphics.Color;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TableLayout;
import android.widget.TableRow;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;
import com.example.praneethpj.handme.com.praneeth.Model.AppConfig;
import com.example.praneethpj.handme.com.praneeth.Model.AppController;
import com.example.praneethpj.handme.com.praneeth.Model.SessionManager;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

public class tables extends AppCompatActivity {


    // json array response url

    private ProgressDialog pDialog;


private String sessionId;

    ListView listView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.table);
        pDialog = new ProgressDialog(this);
        pDialog.setCancelable(false);
        sessionId=getIntent().getStringExtra("EXTRA_SESSION_ID");
        Button btnHome=(Button)findViewById(R.id.btnHome);

        btnHome.setOnClickListener(new View.OnClickListener() {

            public void onClick(View view) {

                Intent i = new Intent(getApplicationContext(),
                        Home.class);
                startActivity(i);
//                Log.d("praneeth",i.getDataString());
                finish();


            }
        });

       SessionManager session = new SessionManager(getApplicationContext());

        listView = (ListView) findViewById(R.id.listView);
        pDialog.setMessage("Loading Marks");
        showDialog();


        getJSON("http://"+AppConfig.IP_ADDRESS+"/HANDME/app/loadStudentMarks.php?id="+sessionId);

    }


    private void getJSON(final String urlWebService) {

        class GetJSON extends AsyncTask<Void, Void, String> {

            @Override
            protected void onPreExecute() {
                super.onPreExecute();
            }


            @Override
            protected void onPostExecute(String s) {
                super.onPostExecute(s);
               //Toast.makeText(getApplicationContext(), s, Toast.LENGTH_SHORT).show();
                Log.d("DATAS",s);
                try {
                    loadIntoListView(s);
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }

            @Override
            protected String doInBackground(Void... voids) {
                try {
                    URL url = new URL(urlWebService);
                    HttpURLConnection con = (HttpURLConnection) url.openConnection();
                    StringBuilder sb = new StringBuilder();
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(con.getInputStream()));
                    String json;
                    while ((json = bufferedReader.readLine()) != null) {
                        sb.append(json + "\n");
                    }
                    return sb.toString().trim();
                } catch (Exception e) {
                    return null;
                }
            }
        }
        GetJSON getJSON = new GetJSON();
        getJSON.execute();
    }

    private void loadIntoListView(String json) throws JSONException {



        JSONArray jsonArray = new JSONArray(json);
        String[] heroes = new String[jsonArray.length()];
        for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject obj = jsonArray.getJSONObject(i);
            heroes[i] = "Student Name:"+obj.getString("firstname")+"\n"+"Exam Name:"+obj.getString("Examname")+"\n"+"Subject Name:"+obj.getString("Subject")+"\n"+"Marks:"+obj.getString("marks")+"\n";

          //  Log.d("DATASS",heroes[i]);
        }
        ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, heroes);
        listView.setAdapter(arrayAdapter);
        hideDialog();
    }

    private void showDialog() {
        if (!pDialog.isShowing())
            pDialog.show();
    }

    private void hideDialog() {
        if (pDialog.isShowing())
            pDialog.dismiss();
    }
}
