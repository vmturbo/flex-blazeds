////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////

package tests.flexunit.mx.messaging
{

import flexunit.framework.*;
import flash.utils.ByteArray;
import mx.controls.Alert;
import mx.utils.*;
/**
 * Tests hex encoding/decoding large byte arrays.
 */
public class HexEncodeLargeByteArrayTest extends TestCase
{
    ////////////////////////////////////////////////////////////////////////////
    //
    // Constructor
    //
    ////////////////////////////////////////////////////////////////////////////   
    public function HexEncodeLargeByteArrayTest(name : String)
    {
        super(name);
    }
    ////////////////////////////////////////////////////////////////////////////
    //
    // TestSuite
    //
    ////////////////////////////////////////////////////////////////////////////      
    public static function suite() : TestSuite
    {
        var suite : TestSuite = new TestSuite();
        suite.addTest(new HexEncodeLargeByteArrayTest("testEncodeLargeByteArray"));
        return suite;
    }    
    ////////////////////////////////////////////////////////////////////////////
    //
    // Tests
    //
    ////////////////////////////////////////////////////////////////////////////   
    /**
     * Test hex encoding/decoding a large byte array using the HexEncoder
     * and HexDecoder classes
     */
    public function testEncodeLargeByteArray():void
    {
        var length:int = 130000;
        var ba:ByteArray = new ByteArray();

        for (var i:int = 0; i < length; i++)
        {
            ba.writeByte((Math.floor(Math.random() * 26) + 65));
        }

        var encoder:HexEncoder = new HexEncoder();
        encoder.encode(ba);
        var result:String = encoder.drain();
		//Alert.show(ObjectUtil.toString(result.length));
        assertEquals(true, length < result.length);
    }
}
}