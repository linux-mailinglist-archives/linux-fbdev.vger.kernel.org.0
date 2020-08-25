Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7164251558
	for <lists+linux-fbdev@lfdr.de>; Tue, 25 Aug 2020 11:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbgHYJ2O (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 25 Aug 2020 05:28:14 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41576 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgHYJ2O (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 25 Aug 2020 05:28:14 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07P9PTpt190836;
        Tue, 25 Aug 2020 09:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=s1TuHGZpOLa28k1h/iYgPdytceu9SbCfGcyqcg+8fTw=;
 b=KIwRjhxVOmR0+G36YQzlTqMIYKtkOgJ6l4y4KcFr0bspJd1lYNz6gO3GO3GmhwkfH5Y7
 6OZASZYuc2XBQoXGY7ml81xru6UPkYugRA1qiCReNyncp3+mYv65Mny/5cewnPj9Cckx
 EDXgaxdB1aOI4T5/CJBrdH1uRC2CwxqUVgdvX6KjVA+sa5PnTBZEcRef7IE8m9GgBOQn
 HjgMc6+k9Li1XCpTxy/V9nqkeJhROzx/eTynzmK71FD/NZw1a/R6y5xQqGV8SFtYHfgU
 ZSJJKpcpGeMtmP9ER7yzIF3oJel58zgYc1cwHnE1ZkO38L5LAG7xZfqcjSHx25z2NwFe yQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 333w6tqxrm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 09:28:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07P9Olve116535;
        Tue, 25 Aug 2020 09:28:02 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 333r9jnkmc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 Aug 2020 09:28:02 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07P9Rxti005040;
        Tue, 25 Aug 2020 09:27:59 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 25 Aug 2020 02:27:58 -0700
Date:   Tue, 25 Aug 2020 12:27:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Timo Aranjo <timo.aranjo@aol.com>
Cc:     kernel-janitors@vger.kernel.org, sudipm.mukherjee@gmail.com,
        teddy.wang@siliconmotion.com, gregkh@linuxfoundation.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] Staging: sm750fb: Fixed a coding style issue
Message-ID: <20200825092752.GT1793@kadam>
References: <1b596369-7c83-73ff-fd4e-ed0d7a714219.ref@aol.com>
 <1b596369-7c83-73ff-fd4e-ed0d7a714219@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b596369-7c83-73ff-fd4e-ed0d7a714219@aol.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250073
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250073
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This commit is corrupted.  Please read the first bit of
Documentation/process/email-clients.rst

regards,
dan carpenter

