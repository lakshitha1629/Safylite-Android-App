package com.example.praneethpj.handme;

import android.app.ProgressDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import android.content.Intent;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.SearchView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.example.praneethpj.handme.com.praneeth.Model.AppConfig;
import com.example.praneethpj.handme.com.praneeth.Model.AppController;
import com.example.praneethpj.handme.com.praneeth.Model.SQLiteHandler;
import com.example.praneethpj.handme.com.praneeth.Model.SessionManager;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Home extends AppCompatActivity {
    private TextView txtName;
    private TextView txtEmail;
    private Button btnLogout;
    private ProgressDialog pDialog;
    private SQLiteHandler db;
    private SessionManager session;
    Button btn,btntime;
    private ListView list;
    private ArrayAdapter adp;
  private  SearchView editsearch;
    String[] animalNameList;
    ArrayList arraylist = new ArrayList ();
final String TAG="Home";
private Button LoadMap;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);



        pDialog = new ProgressDialog(this);
        pDialog.setCancelable(false);

        LoadMap=(Button)findViewById(R.id.button2);

        LoadMap.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {

                Intent myIntent = new Intent(getApplicationContext(), MapsActivity.class);
               // myIntent.putExtra("key", value); //Optional parameters
                startActivity(myIntent);

            }
        });

        StringRequest strReq = new StringRequest(Request.Method.POST,
                AppConfig.URL_LOAD_TYPE, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                Log.d(TAG, "Search Response: " + response.toString());
                hideDialog();

                try {
                    JSONArray jObj = new JSONArray (response);

                    animalNameList=new String[jObj.length()];

                    for(int i=0; i < jObj.length(); i++) {
                        JSONObject jsonobject = jObj.getJSONObject(i);

                        String name    = jsonobject.getString("name");

                       // Log.d("NAMES",name);

                        animalNameList[i]=name;

                    }

                    list = (ListView) findViewById(R.id.listview);

                    for (int i = 0; i < animalNameList.length; i++) {
                        //  AnimalNames animalNames = new AnimalNames(animalNameList[i]);
                        // Binds all strings into an array
                        arraylist.add(animalNameList[i]);
                    }


                    adp= new ArrayAdapter(getApplicationContext(), android.R.layout.simple_list_item_1, arraylist);
                    // Binds the Adapter to the ListView

  list.setAdapter(adp);

                } catch (JSONException e) {
                    // JSON error
                    e.printStackTrace();
                    Toast.makeText(getApplicationContext(), "Json error: " + e.getMessage(), Toast.LENGTH_LONG).show();
                }

            }
        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e(TAG, "Login Error: " + error.getMessage());
                Toast.makeText(getApplicationContext(),
                        error.getMessage(), Toast.LENGTH_LONG).show();
                hideDialog();
            }
        }) {

            @Override
            protected Map<String, String> getParams() {
                // Posting parameters to login url

                return null;

            }

        };
        String tag_string_req = "req_login";
        // Adding request to request queue
        AppController.getInstance().addToRequestQueue(strReq, tag_string_req);

        // Pass results to ListViewAdapter Class





        btn=(Button)findViewById(R.id.btnMark);

        btn.setOnClickListener(new View.OnClickListener() {

            public void onClick(View view) {

                Intent i = new Intent(getApplicationContext(),
                        tables.class);

                i.putExtra("EXTRA_SESSION_ID", txtEmail.getText());
                startActivity(i);
//                Log.d("praneeth",i.getDataString());
             //   finish();


            }
        });

        btntime=(Button)findViewById(R.id.btnTime);

        btntime.setOnClickListener(new View.OnClickListener() {

            public void onClick(View view) {

                Intent i = new Intent(getApplicationContext(),
                        LoadTime.class);
                i.putExtra("EXTRA_SESSION_ID", txtEmail.getText());
                startActivity(i);
//                Log.d("praneeth",i.getDataString());
              //  finish();


            }
        });







        // Locate the EditText in listview_main.xml
        editsearch = (SearchView) findViewById(R.id.simpleSearchView);
        editsearch.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String s) {

                SessionManager ss=new SessionManager(getApplicationContext());

            ss.setKey("type",s);
                Intent i = new Intent(getApplicationContext(),MapsActivity.class);
                startActivity(i);

                return false;
            }

            @Override
            public boolean onQueryTextChange(String s) {
                String text = s;
                 adp.getFilter().filter(text);

                 return false;
            }
        });

        txtName = (TextView) findViewById(R.id.name);
        txtEmail = (TextView) findViewById(R.id.email);
        btnLogout = (Button) findViewById(R.id.btnLogout);

        // SqLite database handler
        db = new SQLiteHandler(getApplicationContext());

        // session manager
        session = new SessionManager(getApplicationContext());

        if (!session.isLoggedIn()) {
            logoutUser();
        }

        // Fetching user details from sqlite
        HashMap<String, String> user = db.getUserDetails();



        String name = user.get("name");
        session.setKey("users",name);
        String email = user.get("email");

        // Displaying the user details on the screen
        txtName.setText(name);
        txtEmail.setText(email);

        // Logout button click event
        btnLogout.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                logoutUser();
            }
        });


    }

    /**
     * Logging out the user. Will set isLoggedIn flag to false in shared
     * preferences Clears the user data from sqlite users table
     * */
    private void logoutUser() {
        session.setLogin(false);

        db.deleteUsers();

        // Launching the login activity
        Intent intent = new Intent(Home.this, login.class);
        startActivity(intent);
        finish();
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