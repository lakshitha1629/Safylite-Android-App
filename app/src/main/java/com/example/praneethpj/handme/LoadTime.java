package com.example.praneethpj.handme;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import com.example.praneethpj.handme.com.praneeth.Model.AppConfig;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class LoadTime extends AppCompatActivity {


    // json array response url

    private ProgressDialog pDialog;


    String sessionId;

    ListView listView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_time);
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






        listView = (ListView) findViewById(R.id.listView);
        pDialog.setMessage("Loading information");
        showDialog();
        getJSON("http://"+ AppConfig.IP_ADDRESS+"/HANDME/app/loadStudentTime.php?id="+sessionId);
//        Log.d("MMURL","http://192.168.8.100/HANDME/app/loadStudentTime.php?id="+sessionId);

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
              // Toast.makeText(getApplicationContext(), s, Toast.LENGTH_SHORT).show();
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
            heroes[i] = "Student Name:"+obj.getString("name")+"\n"+"Subject Name:"+obj.getString("subject")+"\n"+"Date:"+obj.getString("date")+"\n"+"In time:"+obj.getString("intime")+"\n"+"Out time:"+obj.getString("outtime")+"\n";

          Log.d("DATASS",heroes[i]);
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

    /**
     * Created by Praneeth .PJ on 12/3/2018.
     */

    public abstract static class Controller {
    }
}
