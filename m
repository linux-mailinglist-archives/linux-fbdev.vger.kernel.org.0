Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270ED1DC478
	for <lists+linux-fbdev@lfdr.de>; Thu, 21 May 2020 03:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgEUBPF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 20 May 2020 21:15:05 -0400
Received: from mail-dm6nam12on2105.outbound.protection.outlook.com ([40.107.243.105]:5216
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726747AbgEUBPF (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 20 May 2020 21:15:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O06mzBfwn9icuCEq7yn9Nq7ZR12odpMf5dxOVlTvrOwli5T2D3r8f3kjLTLqBAtEob5R6r38w7lmD62brBqbLkIKTiqC1pExyDyudGDDEJ9roeiRNa7pbHaPtO3AyIGjjLBzj+MYhOyK284wfXNP0uNCVILcq/6cXtxiHsoby54k37bbjBeD7jCCZBZein5n/xta5iNUDtdq9TYufYiDkd1lPMOoPWnMxyk4Q0GeqLy+IK4rLQqjIbHKniroMGwWjJDQ7yOdyfGKzZU23oQ26MHflfMYqzuou1DaAqugFue5Q5CEOUF9eqiReeV9hgmz0X0RiWtfz3Q9ah5Srvs4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGR4zBIDWvyuHGFYrA/5o39w86xX0T+rV/chNdvKNAY=;
 b=Nqn4vSnvZLW6EMm8ru8iNmWkN3ZW2Q8ufFotkDhVkQYa+uRJlvny2clHFz9Ab17f/uvaibke3rneJQQYJfutl2XlZNCXNXGi/xzBzVRUgNqitDTsck8GqeIcDh+Wo1F1IVV4Kiu009/TyLIUSb4m8mZIFyCkH31PftL/lNvzxjKwZ8ju2OvrbNcDxi/PlkqUjZ+WpeNudMW/YXbStEQ0og5NSToyvrbvpaWNV6GMHGYN2loBj9SytAvI1hca6aqltut4PZKE8JA8rXZ1lt/z/nyWyofl8OO6v1lJWnXksQihHyekJa6/MMNoflNIZhiFRzJjoHre/46AGL/x25T7TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGR4zBIDWvyuHGFYrA/5o39w86xX0T+rV/chNdvKNAY=;
 b=AWxSM3aZDovUtgPac9etFSV8u4SBdOR0RXaPiOTVIE25pStAp6Sj2n4s3SaBPqdmi54/nVKcoxtkxvQR+nJ83SDLy6yqukgUHTHM0K/qo+2PTC7Z9Ea2jLHhKBEOEF+qQc5yBvw9ek3cI9h4OCzNuN2aa2f/rXOsTXAL+D4vEc4=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4867.namprd06.prod.outlook.com (2603:10b6:208:63::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Thu, 21 May
 2020 01:15:01 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.3021.024; Thu, 21 May 2020
 01:15:01 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>
CC:     "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "Lu, Long" <l.lu@northeastern.edu>,
        "yaohway@gmail.com" <yaohway@gmail.com>
Subject: [Bug Report] drivers/video/fbdev/kyro/fbdev.c: unsigned integer
 wrap-around might cause unexpected behavior
Thread-Topic: [Bug Report] drivers/video/fbdev/kyro/fbdev.c: unsigned integer
 wrap-around might cause unexpected behavior
Thread-Index: AdYvDPkmGOphWO3cRE+TFVL2OMV8xg==
Date:   Thu, 21 May 2020 01:15:00 +0000
Message-ID: <BL0PR06MB45489A53C61DF15BF2F95B9CE5B70@BL0PR06MB4548.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none
 header.from=northeastern.edu;
x-originating-ip: [128.227.216.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44ec53ae-e3cf-4837-6aa2-08d7fd24629c
x-ms-traffictypediagnostic: BL0PR06MB4867:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR06MB48675D7F7CCDD29BB0705F71E5B70@BL0PR06MB4867.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 041032FF37
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A5WlayApdPKivryFF4l3iA0+sJZEdXekefrkSsnzqGk4WMnPMfZhnLIpjU3mKkyoACznlHfgxnRhckxyGO/j6l72UmX0LMlnu9MpBVNrw1z+DTMkuW+1Vwfzta12L3jYiIVXpMJYTgXlAadkZlGxaMzDRoTMGkpOpI5v1kFnxpwZFxYI47UxFeIdlbVUuzAHeeCryObfQR/DRsbCRgbfVYHg2GEnyOJkXEX2l6Jg/ik4O+GtqjNbSkQqpR8stvB6wJMNPRyduhqNtAJPZ1dBErSQFpoTtrhcImARxGEWYU73zR35KN5GHCkfWrZT5W7sEUVKiOz0FxI1Gbalf+BFeNcQTX0SpohrugdzrpxH1t8BPJ+tfjNMV8xVwJKr/sTTgKkaflJv8AlJgvjW+aBkmOrltlb/TjQ1ixMVXDKScO1Vfm+I5o5nQG1+EoxNULS/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR06MB4548.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(4326008)(33656002)(55016002)(66476007)(6916009)(8676002)(86362001)(316002)(786003)(2906002)(8936002)(76116006)(75432002)(54906003)(5660300002)(7696005)(52536014)(66446008)(66556008)(66946007)(6506007)(9686003)(478600001)(64756008)(71200400001)(186003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Tm7qhiMvTEirtkV83q0ftiqAyVJ8PTYyypIiC0/HYZmjmo3fVSlCdR1wVJkvUL0DuA7QbrB317tsIGu4Hsk9FlZgf59IB3HYevgFRCcjwl3GYc7XRPNl/h8dMg6/PS4jc3hlccWLr5PKRkSU26PYp5qw7u7dhBSPS/WoALG4q7LoJwJkZOca7777zfIzc0nAJ8fMi1xCVxj+BlS/nJUeCXGj7RgViDRqU1dz76N6guabm/rxhpzpQstIHzqTzaEIToEvhxL7IA3v6r2QcH6rLyEkC9kLockTrsAxrzB1BWyo7tUTb3yLYXHWA7cmvUcU4ohJZ1IBDgO0WJP+nqZGaiRqOZLO9MkN3YQ9N8zXKb7zYI/wg2akNArwtwdslORfEgqv9jf2T71TVGtSHy0IOUVhY5i8aiyfdbwGuHHvb8fmBmFBp9+ZMtkRQmejMtPEi4/VcqPt6VoJxgJqgD894o3fbzLd+pUBapT4o35lo7Rvm+2qV4SJpgI9mDwFx7ls
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ec53ae-e3cf-4837-6aa2-08d7fd24629c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2020 01:15:00.9963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wg9Z8XZTmQxJNUhF64ekDJB4oJ14AVLb0vKo6nFZhIgigCLU3hZHfkWtMEMGcToEgeEwan08QI+D+GluxKl6SBCR8aJV0LUchvwHjmvdyD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4867
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Bartlomiej,
Greetings, I'm a first-year PhD student who is interested in the usage of U=
BSan for linux.=20
And after some experiments, I found that in drivers/video/fbdev/kyro/fbdev.=
c
function kyro_dev_overlay_viewport_set, there is an unsigned integer overfl=
ow that might cause unexpected behavior.

More specifically, first at its caller, kyrofb_ioctl, after execution of co=
py_from_user at line 599, struct ol_viewport_set is filled with data from u=
ser space.=20
And the 4 32bit unsigned integers from it are passed into kyro_dev_overlay_=
viewport_set. In function kyro_dev_overlay_viewport_set,=20
x is added with ulWidth, y is added with ulHeight to transfer the length to=
 the coordinate.=20
And the result coordinate might overflow and wrap around. And it is passed =
into function SetOverlayViewPort.

It appears that in function SetOverlayViewPort, these values are treated as=
 the coordinate of the bottom-right point and the wrap-around is not checke=
d.(I might miss something).

Due to the lack of knowledge of the interaction between this module and the=
 user space, I'm not able to assess if this is a benign wrap-around or whet=
her the wrap-around could happen at all.=20
I'd appreciate for you comment on this issue, this could help me understand=
 linux and unsigned wrap around a lot.

Looking forward to your valuable response!

Best,
Changming Liu
